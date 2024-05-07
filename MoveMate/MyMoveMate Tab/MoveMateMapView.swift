//
//  MoveMateMapView.swift
//  MoveMate
//
//  Created by Hannarong Kaewkiriya on 30/4/2567 BE.
//

import SwiftUI
import MapKit
import SwiftData

struct MoveMateMapView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var visibleRegion: MKCoordinateRegion?
    @Environment(LocationManager.self) var locationManager
    @State private var cameraPosition: MapCameraPosition = .userLocation(fallback: .automatic)
    @Query private var listPlacemarks: [MTPlacemark]
    
    // Search
    @State private var searchText = ""
    @FocusState private var searchFieldFocus: Bool
    @Query(filter: #Predicate<MTPlacemark> {$0.destination == nil}) private var searchPlacemarks: [MTPlacemark]
    
    @State private var selectedPlacemark: MTPlacemark?
    
    // Route
    @State private var showRoute = false
    @State private var routeDisplaying = false
    @State private var route: MKRoute?
    @State private var routeDestination: MKMapItem?
    @State private var travelInterval: TimeInterval?
    @State private var transportType = MKDirectionsTransportType.automobile
    @State private var showSteps = false
    @Namespace private var mapScope
    @State private var mapStyleConfig = MapStyleConfig()
    @State private var pickMapStyle = false
    
    var body: some View {
        Map(position: $cameraPosition, selection: $selectedPlacemark, scope: mapScope) {
            UserAnnotation()
            ForEach(listPlacemarks) { placemark in
                if !showRoute {
                    Group {
                        if placemark.destination != nil {
                            Marker(coordinate: placemark.coordinate) {
                                Label(placemark.name, systemImage: "star")
                            }
                            .tint(.yellow)
                        } else {
                            Marker(placemark.name, coordinate: placemark.coordinate)
                        }
                    }.tag(placemark)
                } else {
                    if let routeDestination {
                        Marker(item: routeDestination)
                            .tint(.green)
                    }
                }
            }
            if let route, routeDisplaying {
                MapPolyline(route.polyline)
                    .stroke(.blue, lineWidth: 6)
            }
        }
        .frame(height: 720.0)
        .sheet(item: $selectedPlacemark) { selectedPlacemark in
            LocationDetailView(
                selectedPlacemark: selectedPlacemark,
                showRoute: $showRoute,
                travelInterval: $travelInterval,
                transportType: $transportType
            )
                .presentationDetents([.height(450)])
        }
        .onMapCameraChange{ context in
            visibleRegion = context.region
        }
        .onAppear {
            MapManager.removeSearchResults(modelContext)
            updateCameraPosition()
        }
        .mapControls{

            MapScaleView()
                
        }
        .mapStyle(mapStyleConfig.mapStyle)
        .task(id: selectedPlacemark) {
            if selectedPlacemark != nil {
                routeDisplaying = false
                showRoute = false
                route = nil
                await fetchRoute()
            }
        }
        .onChange(of: showRoute) {
            selectedPlacemark = nil
            if showRoute {
                withAnimation {
                    routeDisplaying = true
                    if let rect = route?.polyline.boundingMapRect {
                        cameraPosition = .rect(rect)
                    }
                }
            }
        }
        .task(id: transportType) {
            await fetchRoute()
        }
        .safeAreaInset(edge: .bottom) {
            HStack {
                VStack {
                    HStack(spacing: 15) {
                        TextField("Search...", text: $searchText)
                            .padding(.horizontal, 15.0)
                            .padding(.vertical, 10)
                            .textFieldStyle(.roundedBorder)
                            .autocorrectionDisabled()
                            .textInputAutocapitalization(.never)
                            .focused($searchFieldFocus)
                            .overlay(alignment: .trailing) {
                                if searchFieldFocus {
                                    Button {
                                        searchText = ""
                                        searchFieldFocus = false
                                    } label: {
                                        Image(systemName: "xmark.circle.fill")
                                    }
                                    .offset(x: -20)
                                }
                            }

                            .onSubmit {
                                Task {
                                    await MapManager.searchPlaces(
                                        modelContext,
                                        searchText: searchText,
                                        visibleRegion: visibleRegion
                                    )
                                    searchText = ""
                                }
                            }
                        if routeDisplaying {
                            HStack {
                                Button("Clear Route", systemImage: "xmark.circle") {
                                    removeRoute()
                                }
                                .buttonStyle(.borderedProminent)
                                .fixedSize(horizontal: true, vertical: false)
                                Button("Show Steps", systemImage: "location.north") {
                                    showSteps.toggle()
                                }
                                .buttonStyle(.borderedProminent)
                                .fixedSize(horizontal: true, vertical: false)
                                .sheet(isPresented: $showSteps) {
                                    if let route {
                                        NavigationStack {
                                            List {
                                                HStack {
                                                    Image(systemName: "mappin.circle.fill")
                                                        .foregroundStyle(.red)
                                                    Text("From my location")
                                                    Spacer()
                                                }
                                                ForEach(1..<route.steps.count, id: \.self) { idx in
                                                    VStack(alignment: .leading) {
                                                        Text("\(transportType == .automobile ? "Drive" : "Walk") \(MapManager.distance(meters: route.steps[idx].distance))")
                                                            .bold()
                                                        Text(" - \(route.steps[idx].instructions)")
                                                    }
                                                }
                                            }
                                                                                        .listStyle(.plain)
                                            .navigationTitle("Steps")
                                            .navigationBarTitleDisplayMode(.inline)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                    
                    HStack(spacing: 30.0) {
                        if !searchPlacemarks.isEmpty {
                            Button {
                                MapManager.removeSearchResults(modelContext)
                            } label: {
                                Image(systemName: "mappin.slash")
                            }
                            .buttonStyle(.borderedProminent)
                            .tint(.red)
                        }
                        
                        Button {
                            pickMapStyle.toggle()
                        } label: {
                            Image(systemName: "gearshape")
                                .foregroundColor(Color(red: 0.94901961, green: 0.54901961, blue: 0.05882353, opacity: 1))
                                .imageScale(.large)
                        }
                        .padding(8.0)
                        .background(.thickMaterial)
                        .clipShape(.circle)
                        .sheet(isPresented: $pickMapStyle) {
                            MapStyleView(mapStyleConfig: $mapStyleConfig)
                                .presentationDetents([.height(275)])
                        }
                        MapUserLocationButton(scope: mapScope)
                            .tint(.accentColor)
                        MapCompass(scope: mapScope)
                            .mapControlVisibility(.visible)
                        MapPitchToggle(scope: mapScope)
                            .tint(.accentColor)
                            .mapControlVisibility(.visible)
                    }
                    .padding(.bottom, 200.0)
                    .buttonBorderShape(.circle)
                }
            }
        }
        .cornerRadius(30)
        .mapScope(mapScope)
    }
    
    func updateCameraPosition() {
        if let userLocation = locationManager.userLocation {
            let userRegion = MKCoordinateRegion(
                center: userLocation.coordinate,
                span: MKCoordinateSpan(
                    latitudeDelta: 0.15,
                    longitudeDelta: 0.15
                )
            )
            withAnimation {
                cameraPosition = .region(userRegion)
            }
        }
    }
    
    func fetchRoute() async {
        if let userLocation = locationManager.userLocation, let selectedPlacemark {
            let request = MKDirections.Request()
            let sourcePlacemark = MKPlacemark(coordinate: userLocation.coordinate)
            let routeSource = MKMapItem(placemark: sourcePlacemark)
            let destinatinPlacemark = MKPlacemark(coordinate: selectedPlacemark.coordinate)
            routeDestination = MKMapItem(placemark: destinatinPlacemark)
            routeDestination?.name = selectedPlacemark.name
            request.source = routeSource
            request.destination = routeDestination
            request.transportType = transportType
            let directions = MKDirections(request: request)
            let result = try? await directions.calculate()
            route = result?.routes.first
            travelInterval = route?.expectedTravelTime
        }
    }
    
    func removeRoute() {
        routeDisplaying = false
        showRoute = false
        route = nil
        selectedPlacemark = nil
        updateCameraPosition()
    }
}

#Preview {
    MoveMateMapView()
        .environment(LocationManager())
        .modelContainer(Destination.preview)
}
