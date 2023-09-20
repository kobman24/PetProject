//
//  StathamScreen.swift
//  Statham
//
//  Created by Сейран on 19.09.2023.
//

import SwiftUI

struct StathamScreen: View {
    @EnvironmentObject var saveManager: SaveManager
    @StateObject var citata = Networking()
    
    @State private var isLoading = false
    var body: some View {
        
        VStack {
            
            Text("Джейсон Стейтем однажды сказал:")
                
            VStack {
                StathamView(qoute: citata.finalquote?.quoteText ?? "Цитата")
                
                
                Button {
                    isLoading = true
                    citata.fetchRandomQuote()
                    
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 200, height: 50)
                        Text("получить мудрость")
                            .foregroundColor(.white)
                    }
                }
                .disabled(isLoading)
                .padding()
                
            }
            .padding()
            .onReceive(citata.$finalquote) { _ in
                isLoading = false
            }
            Button {
                guard var finalquote = citata.finalquote?.quoteText else { return }
                saveManager.saveFinalQuote(finalquote: finalquote)
                print("мудрость сохранена")
            } label: {
                VStack{
                    Image(systemName: "heart.fill")
                        .resizable()
                        .foregroundColor(.pink)
                        .frame(width: 50, height: 50)
                    Text("добавить в избранное")
                        .foregroundColor(.pink)
                }.padding()
            }
        }
    }
}

struct StathamScreen_Previews: PreviewProvider {
    static var previews: some View {
        StathamScreen()
            .environmentObject(SaveManager()) 
    }
}
