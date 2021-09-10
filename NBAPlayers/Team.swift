//
//  Team.swift
//  NBAPlayers
//
//  Created by Flash Jessi on 8/27/21.
//  Copyright © 2021 Svetlana Frolova. All rights reserved.
//

import Foundation

struct Team: Decodable {
    let name: String
    let city: String
    let conference: String
    let abbreviation: String
    
    var fullName: String {
        return city + " " + name
    }
}
