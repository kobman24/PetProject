

import Foundation


class PlayersViewModel: ObservableObject {
    @Published var players: [Player] = []
    
    init() {
        fetchPlayersData()
    }

    func fetchPlayersData() {
        let urlString = "https://toptenplayerinthehisoty-default-rtdb.europe-west1.firebasedatabase.app/LakerPlayers.json"
         
        guard let url = URL(string: urlString) else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let dataPlayers = try decoder.decode([Player].self, from: data)
                    DispatchQueue.main.async {
                        self.players = dataPlayers
                    }
                } catch {
                    print("Ошибка при парсинге JSON: \(error)")
                }
            }
        }.resume()
    }
}

    

