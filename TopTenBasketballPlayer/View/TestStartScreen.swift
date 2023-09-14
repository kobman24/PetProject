

import SwiftUI

struct TestStartScreen: View {
    var body: some View {
        
            GeometryReader { geometry in
                let maxWidth = geometry.size.width - 75
                ScrollView{
                VStack{
                    Text("выберите команду западной конференции ")
                        .padding()
                        .font(.system(.headline))
                        .foregroundColor(Color.red)
                    ForEach(WeastTeams.allCases, id: \.self) {team in
                        VStack {
                            Button {
                                print("работает")
                            } label: {
                                Text(team.rawValue)
                                    .font(.headline)
                                    .foregroundColor(Color.white)
                                    .padding()
                                
                            }
                            
                            .frame(width: maxWidth)
                            
                            .background(SelectColorForButton.getButtonColor(for: team))
                            
                            .clipShape(RoundedRectangle(cornerRadius: 18))
                            
                            
                        }
                    }.padding(10)
                }
            }
        }
    }
}

struct TestStartScreen_Previews: PreviewProvider {
    static var previews: some View {
        TestStartScreen()
    }
}
