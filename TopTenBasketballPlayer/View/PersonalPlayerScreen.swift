

import SwiftUI

struct PersonalPlayerScreen: View {

    var player1: Player
    
    
    
    var body: some View {
        ScrollView{
            
            VStack{
                Image(player1.imageName)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 18))
                Group{
                    Text(player1.name)
                    HStack{
                        Text("годы выступлений : ")
                        Text(player1.careerYears)
                    }
                    
                    Text(player1.shortBiography)
                        .padding(.bottom)
                }.padding()
                
            }
            .background()
            .clipShape(RoundedRectangle(cornerRadius: 18))
            .padding(4)
            .shadow(radius: 10)
            
        }
        
    }
}


