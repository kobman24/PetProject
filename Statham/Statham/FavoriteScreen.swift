//
//  FavoriteScreen.swift
//  Statham
//
//  Created by Сейран on 19.09.2023.
//

import SwiftUI

struct FavoriteScreen: View {
    @EnvironmentObject var saveManager: SaveManager
   
    
    var body: some View {
        VStack{
            Text("Избранное")
                .font(.system(size: 24))
            ScrollView {
                var uniqueQuote = Array(Set(saveManager.arrayFinalQuote))
                ForEach(uniqueQuote, id: \.self) {qoute in
                    
                    
                    StathamView(qoute: qoute)
                }
            }.padding()
            
        }
    }
}



struct FavoriteScreen_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteScreen()
            .environmentObject(SaveManager())
    }
}
