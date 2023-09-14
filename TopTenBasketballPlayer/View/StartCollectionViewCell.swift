

import SwiftUI


struct StartCollectionViewCell: View {
    var nameImageTeams: String
    let width = (UIScreen.main.bounds.width/3) - 10
    var body: some View {
        VStack{
            Image(nameImageTeams)
                .resizable()
                .frame(width: width, height: width)
                .cornerRadius(15)
                
                
        }

    }
}

struct StartCollectionViewCell_Previews: PreviewProvider {
    static var previews: some View {
        StartCollectionViewCell(nameImageTeams: "lal")
    }
}
