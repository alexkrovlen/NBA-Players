//
//  Game.swift
//  NBAPlayers
//
//  Created by Flash Jessi on 8/30/21.
//  Copyright © 2021 Svetlana Frolova. All rights reserved.
//

import Foundation

struct GamesResponse: Decodable {
    let data: [Game]
}

struct Game: Decodable {
    let date: String
    
    let homeTeam: Team
    let visitorTeam: Team
    
    let homeTeamScore: Int
    let visitorTeamScore: Int
    
    enum CodingKeys: String, CodingKey {
        case date = "date"
        case homeTeam = "home_team"
        case visitorTeam = "visitor_team"
        case homeTeamScore = "home_team_score"
        case visitorTeamScore = "visitor_team_score"
    }
    
}
