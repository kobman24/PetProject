//
//  LoginFireBaseApp.swift
//  LoginFireBase
//
//  Created by Сейран on 27.06.2023.
//

import SwiftUI
import Firebase

@main
struct LoginFireBaseApp: App {
    @StateObject var viewModel = AuthViewModel()
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(viewModel)
        }
    }
}
