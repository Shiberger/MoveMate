//
//  MoveMateApp.swift
//  MoveMate
//
//  Created by Hannarong Kaewkiriya on 30/4/2567 BE.
//

import SwiftUI

@main
struct MoveMateApp: App {
    @State private var locationManager = LocationManager()
    var body: some Scene {
        WindowGroup {
            if locationManager.isAuthorized {
                StartTab()
            } else {
                LocationDeniedView()
            }
        }
        .modelContainer(for: Destination.self)
        .environment(locationManager)
    }
}
