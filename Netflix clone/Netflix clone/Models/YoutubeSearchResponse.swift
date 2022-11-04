//
//  YoutubeSearchResponse.swift
//  Netflix clone
//
//  Created by aleksandar on 12.10.22..
//

import Foundation

struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}

struct VideoElement: Codable {
    let id: VideoKind
}

struct VideoKind: Codable {
    let kind: String
    let videoId: String
}
