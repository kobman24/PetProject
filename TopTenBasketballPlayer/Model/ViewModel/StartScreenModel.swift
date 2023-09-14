

import Foundation
import SwiftUI

enum NbaTeams: String {
    case lal = "Los Angeles Laker"
    case lac
    case gsw
    case heat
    case orlando
    case denver
    case seltic
    case sharlot
    case toronto
    case atlanta
    
    
}
enum WeastTeams: String, CaseIterable {
    case lal = "Los Angeles Lakers  "
    case lac = "Los Angeles Clippers"
    case den = "Denver Nuggets "
    case mem = "Memphis Grizzlies"
    case sac = "Sacramento Kings "
    case pnx = "Phoenix Suns"
    case gsw = "Golden State Warriors"
    case min = "Minnesota Timberwolves"
    case pel = "New Orleans Pelicans"
    case okl = "Oklahoma City Thunder"
    case dal = "Dallas Mavericks"
    case uta = "Utah Jazz"
    case por = "Portland Trail Blazers"
    case roc = "Houston Rockets"
    case sas = "San Antonio Spurs"
}
//struct WeastTeam {
//    let id = UUID()
//    let westTeam: String
//}
//
//struct EastTeam {
//    let id = UUID()
//    let eastTeam: String
//    static func generateArrayEastTeam(teamarray: [String]) -> [EastTeam] {
//        var teams: [EastTeam] = []
//        for name in teamarray {
//            let team = EastTeam(eastTeam: name)
//            teams.append(team)
//        }
//        return teams
//    }
//}
//
//let eastTeams = [""]
//let wastTeams = [""]


//метод выбора цвета для кнопки в соответсвии с командой
enum SelectColorForButton{
    static func getButtonColor(for team: WeastTeams) -> Color {
        switch team {
        case .lal:
            return Color.purple
        case .lac:
            return Color.secondary
            
        case .den:
            return Color.brown
        case .mem:
            return Color.indigo
        case .sac:
            return Color.pink
        case .pnx:
            return Color.orange
        case .gsw:
            return Color.yellow
        case .min:
            return Color.green
        case .pel:
            return Color.red
        case .okl:
            return Color.mint
        case .dal:
            return Color.blue
        case .uta:
            return Color.orange
        case .por:
            return Color.black
        case .roc:
            return Color.red
        case .sas:
            return Color.black
        }
    }
}


