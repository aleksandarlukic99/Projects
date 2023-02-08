//
//  Petition.swift
//  WhitehousePetitions
//
//  Created by Aleksandar Lukic on 8.2.23..
//

import Foundation

struct Petition: Codable {
    var title: String
    var body: String
    var signatureCount: Int
}

struct Petitions: Codable {
    var results: [Petition]
}
