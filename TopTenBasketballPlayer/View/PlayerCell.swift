
import SwiftUI

struct PlayerCell: View {
    var model: BasketPlayer
    var body: some View {
        VStack {
            Image(model.image)
                .resizable()
                .scaledToFit()
            VStack{
                Text(model.name)
                HStack{
                    Text("годы карьеры :")
                    Text(model.careerYears)
                    
                }
                
            }
            .font(.headline)
            .padding()
            
            
        }
        .background()
        .clipShape(RoundedRectangle(cornerRadius: 18))
        
        
        
    }
}

struct PlayerCell_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            PlayerCell(model: BasketPlayer(name: "Kobe Bryant", image: "kobe", careerYears: "1996-2016"))
                .shadow(radius: 20)
                .padding()
            Spacer()
        }
        
        
    }
}

