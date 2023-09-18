//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Ahmad Qureshi on 18/09/23.
//

import SwiftUI

@main
struct WeatherAppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                WeatherView()
            }
            .navigationViewStyle(.stack)
           
        }
    }
}
