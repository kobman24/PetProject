//
//
//import SwiftUI
//
//struct FeedTenPlayer: View {
//    
//    
//    
//    var tenPlayersOfClub: [BasketPlayer]
//    
//    
//    
//    
//    var body: some View {
//        NavigationStack{
//            
//            ScrollView{
//                LazyVStack{
//                    ForEach(tenPlayersOfClub, id: \.id) { player in
//                        NavigationLink {
//                            PersonalPlayerScreen(player: player)
//                        } label: {
//                            PlayerCell(model: player)
//                                .shadow(radius: 18)
//                                .padding()
//                        }
//
//                        
//                        
//                    }
//                    
//                }
//                
//            }
//            
//        }
//       
//    }
//}
//
//struct FeedTenPlayer_Previews: PreviewProvider {
//    static var previews: some View {
//        FeedTenPlayer(tenPlayersOfClub: testPlayers)
//    }
//}
//
//private var testPlayers: [BasketPlayer] = [
//    .init(name: "one", image: "kobe", careerYears: "1990-2000"),
//    .init(name: "two", image: "kobe", careerYears: "1991-2001"),
//    .init(name: "third", image: "kobe", careerYears: "1992-2002"),
//    .init(name: "four", image: "kobe", careerYears: "1992-2002"),
//    .init(name: "five", image: "kobe", careerYears: "1992-2002"),
//    .init(name: "six", image: "kobe", careerYears: "1992-2002"),
//    .init(name: "seven", image: "kobe", careerYears: "1992-2002"),
//    .init(name: "seven", image: "kobe", careerYears: "1992-2002")
//
//]
