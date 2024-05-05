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
            .toolbarBackground(Color(#colorLiteral(red: 0.109803922, green: 0.301960784, blue: 0.549019608, alpha: 1)).opacity(1), for: .tabBar)
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
