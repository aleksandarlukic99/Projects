//
//  APIResponse.swift
//  SearchPhoto
//
//  Created by aleksandar on 28.12.21..
//

import Foundation

struct APIResponse: Codable {
    let total: Int
    let total_pages: Int
    let results: [Results]
}

struct Results: Codable {
    let id: String
    let urls: URLS
    let likes: Int
    let alt_description: String?
    let user: User
}

struct URLS: Codable {
    let regular: String
    let full: String
}

struct User: Codable {
    let username: String
    let name: String
    let profile_image: ProfileImage
}

struct ProfileImage: Codable {
    let medium: String
}
