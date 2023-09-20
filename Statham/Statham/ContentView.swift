//
//  ContentView.swift
//  Statham
//
//  Created by Сейран on 19.09.2023.
//

import SwiftUI

struct ContentView: View {
   
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            
            StathamScreen()
                
                .tabItem {
                    Label("цитаты", systemImage: "house.circle")
                      
                }
                .tag(0)
            
            FavoriteScreen()
                .tabItem {
                    Label("избранное", systemImage: "heart.fill")
                   
                }
                .tag(1)
        }
      
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(SaveManager())
    }
}
