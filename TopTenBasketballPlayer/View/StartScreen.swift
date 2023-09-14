

import SwiftUI

struct StartScreen: View {
    @State private var tagSelection: String? = nil
    var teams : NbaTeams = .lal
    var body: some View {
        NavigationStack{
            VStack{
                NavigationLink(destination: TestViewForData(), tag: "TestViewForData", selection: $tagSelection) { EmptyView() }
                Text("выберите команду нба")
                    .padding()
                    .font(.system(.headline))
                    .foregroundColor(Color.red)
                Button {
                    tagSelection = "TestViewForData"
                } label: {
                    VStack{
                        
                            Text("\(teams.rawValue)")
                                .font(.system(size: 24))
                                .foregroundColor(Color.purple)
                                .padding()
                        
                    }
                    .background(Color.yellow)
                    .clipShape(RoundedRectangle(cornerRadius: 18))
                    .padding()
                    .shadow(radius: 10)
                }

                
            }
            }
        
        
        }
    }


struct StartScreen_Previews: PreviewProvider {
    static var previews: some View {
        StartScreen()
    }
}
