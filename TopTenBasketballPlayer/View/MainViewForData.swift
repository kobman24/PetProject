

import SwiftUI

struct MainViewForData: View {
    @StateObject var viewData = PlayersViewModel()
    var body: some View {
        NavigationStack{
            ScrollView {
                LazyVStack {
                    ForEach(viewData.players, id: \.id, content: { players in
                        NavigationLink{
                            PersonalPlayerScreen(player1: players)
                        } label: {
                            
                            VStack {
                                Image(players.imageName)
                                    .resizable()
                                    .scaledToFit()
                                Text(players.name)
                                HStack{
                                    Text("годы выступлений:")
                                    Text(players.careerYears)
                                    
                                }.padding()
                                
                            }
                            
                            .background()
                            .clipShape(RoundedRectangle(cornerRadius: 18))
                            .padding()
                            .shadow(radius: 10)
                            
                            
                        }
                    })
                }
            }

            
            .onAppear {
                // Загружаем данные, когда представление появляется на экране
                viewData.fetchPlayersData()
            }
            .navigationTitle("TOP 10 PLAYERS EVER")
        }
    }
    }


struct MainViewForData_Previews: PreviewProvider {
    static var previews: some View {
        MainViewForData()
    }
}
