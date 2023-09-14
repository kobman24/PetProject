

import Foundation

struct Teams {
  
    let name: String
    let imageName: String
    let players : [Players]
}

struct Players {
    let id = UUID()
    var name: String
    var careerYears: String
    var shortBiography: String
    var imageName: String
    
}

