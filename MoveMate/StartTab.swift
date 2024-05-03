//
//  ContentView.swift
//  MoveMate
//
//  Created by Hannarong Kaewkiriya on 30/4/2567 BE.
//

import SwiftUI

struct StartTab: View {

    var body: some View {
        TabView {
            Group {
                MoveMateMapView()
                    .tabItem {
                    Label("MoveMate Map", systemImage: "map")
                }
                DestinationsListView()
                    .tabItem {
                        Label("Destinations", systemImage: "globe.desk")
                    }
            }
            .toolbarBackground(.appBlue.opacity(0.8), for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarColorScheme(.dark, for: .tabBar)
        }
    }
}


#Preview {
    StartTab()
        .modelContainer(Destination.preview)
        .environment(LocationManager())
}
