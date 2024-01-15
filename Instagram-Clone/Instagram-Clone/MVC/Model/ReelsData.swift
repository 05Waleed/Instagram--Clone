//
//  ReelsData.swift
//  Instagram-Clone
//
//  Created by Muhammad Waleed on 12.01.2024.
//

import Foundation

struct ReelsData: Codable {
    let reelsURL: [ReelsURL]

    enum CodingKeys: String, CodingKey {
        case reelsURL = "reelsUrl"
    }
}

// MARK: - ReelsURL
struct ReelsURL: Codable {
    let title, views: String
    let videoURL: String
    let vidLikesNum, vidCommentsNum: Int

    enum CodingKeys: String, CodingKey {
        case title, views
        case videoURL = "videoUrl"
        case vidLikesNum, vidCommentsNum
    }
}
