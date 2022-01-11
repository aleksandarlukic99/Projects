//
//  File.swift
//  NBAplayers
//
//  Created by aleksandar on 30.12.21..
//

import Foundation

struct APIResponse: Codable {
    let data: [PlayerData]
}

struct PlayerData: Codable {
    let id: Int
    let first_name: String
    let last_name: String
    let position: String
    let team: Team
}

struct Team: Codable {
    let id: Int
    let city: String
    let conference: String
    let full_name: String
}

struct SecondAPI: Codable {
    let data: [PlayerDetails]
}

struct PlayerDetails: Codable {
    let pts: Double
    let reb: Double
    let ast: Double
    let stl: Double
    let games_played: Int
}
