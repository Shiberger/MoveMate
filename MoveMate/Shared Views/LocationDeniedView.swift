//
//  LocationDeniedView.swift
//  MoveMate
//
//  Created by Hannarong Kaewkiriya on 2/5/2567 BE.
//

import SwiftUI

struct LocationDeniedView: View {
    var body: some View {
        ContentUnavailableView(label: {
            Label("Location Services", image: "launchScreen")
        },
                               description: {
            Text("""
1. Tab the button below and go to "Privacy and Security"
2. Tap on "Location Services"
3. Locate the "MoveMate" app and tap on it
4. Change the setting to "While Using the App"
""")
            .multilineTextAlignment(.leading)
        },
                               actions: {
            Button(action: {
                UIApplication.shared.open(
                    URL(string: UIApplication.openSettingsURLString)!,
                    options: [:],
                    completionHandler: nil
                )
            }) {
                Text("Open Settings")
            }
            .buttonStyle(.borderedProminent)
            .tint(Color(red: 0.94901961, green: 0.54901961, blue: 0.05882353))
        })
    }
}

#Preview {
    LocationDeniedView()
}
