//
//  StathamApp.swift
//  Statham
//
//  Created by Сейран on 19.09.2023.
//

import SwiftUI

@main
struct StathamApp: App {
    @StateObject var saveManager = SaveManager()
    var body: some Scene {
        WindowGroup {
          ContentView()
                .environmentObject(saveManager)

        }
    }
}
