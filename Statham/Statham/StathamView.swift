//
//  StathamView.swift
//  Statham
//
//  Created by Сейран on 20.09.2023.
//

import SwiftUI

struct StathamView: View {
    var qoute: String
    var body: some View {
        ZStack(alignment: .topLeading) {
            Image("StathamSecond")
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 10))
            ScrollView(showsIndicators: false) {
                VStack {
                    ZStack(alignment: .leading){
                        
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.clear)
                            .frame(width: 200, height: 222)
                        
                        Text(qoute)
                            .padding()
                            .frame(maxWidth: 200)
                        
                        
                    }
                }
            }
            .frame(width: 200, height: 222)
        }
    }
}

struct StathamView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            StathamView(qoute: "Цитата")
            Spacer()
        }.padding()
    }
}
