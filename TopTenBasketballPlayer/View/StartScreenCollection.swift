

import SwiftUI

struct StartScreenCollection: View {
    
    
    var arrayTeamsName = ["lal","lac","sus","mia","por","mag","atlanta","pel","boston","bry","gsw","fin","ind","mem","sac","hor","mil","min","new","tor","uta","okc","fil","detriot","washington","dal","den","cav","chi","roc"]
    let gridItem = GridItem(.adaptive(minimum: 100), spacing: 16, alignment: .top)
    
    
    
    
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVGrid(columns: [gridItem], spacing: 10) {
                    ForEach(arrayTeamsName, id: \.self) { teamName in
                        NavigationLink(destination: MainViewForData()) {
                            StartCollectionViewCell(nameImageTeams: teamName)
//                                .onTapGesture {
//                                    print("навигация работает вы выбрали \(teamName)")
//                                    
//                                }
                        }
                       
                    }
                }
                
                
                
            }
            
            .padding(5)
            .navigationTitle("выберите команду")
        }
    }
}

struct StartScreenCollection_Previews: PreviewProvider {
    static var previews: some View {
        StartScreenCollection()
    }
}
