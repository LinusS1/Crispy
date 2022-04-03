//
//  CrispyApp.swift
//  Crispy
//
//  Created by Linus Skucas on 3/24/22.
//

import SwiftUI

@main
struct CrispyApp: App {
    @StateObject var crispyVM = CrispyViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(minWidth: 400, maxWidth: .infinity, minHeight: 430, maxHeight: .infinity)
                .environmentObject(crispyVM)
        }
        Settings {
            PreferencesView()
        }
    }
}
