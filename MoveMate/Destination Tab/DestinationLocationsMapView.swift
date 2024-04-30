//
//  DestinationLocationsMapView.swift
//  MoveMate
//
//  Created by Hannarong Kaewkiriya on 30/4/2567 BE.
//

import SwiftUI
import MapKit
import SwiftData

struct DestinationLocationsMapView: View {
    
    @State private var cameraPositon: MapCameraPosition = .automatic
    @State private var visibleRegion: MKCoordinateRegion?
    @Query private var destinations: [Destination]
    @State private var destination: Destination?
    
    var body: some View {
        Map(position: $cameraPositon) {
            if let destination {
                ForEach(destination.placemarks) { placemark in
                    Marker(coordinate: placemark.coordinate) {
                        Label(placemark.name, systemImage: "star")
                    }
                    .tint(.blue)
                }
            }
            
        }
        .onMapCameraChange(frequency: .onEnd) { context in 
            visibleRegion = context.region
        }
            .onAppear {
                // 13.753253, 100.501641
                destination = destinations.first
                if let region = destination?.region {
                    cameraPositon = .region(region)
                }
                
        }
    }
}

#Preview {
    DestinationLocationsMapView()
        .modelContainer(Destination.preview)
}
