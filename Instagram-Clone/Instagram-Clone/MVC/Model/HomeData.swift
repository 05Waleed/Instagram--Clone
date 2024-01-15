//
//  HomeData.swift
//  Instagram-Clone
//
//  Created by Muhammad Waleed on 12.01.2024.
//

import Foundation

struct HomeData: Codable {
    let homeFeed: [HomeFeed]
    let homeStories: [HomeStory]

    enum CodingKeys: String, CodingKey {
        case homeFeed = "HomeFeed"
        case homeStories = "HomeStories"
    }
}

struct HomeFeed: Codable {
    let feedImage: String
    let likesCount: Int
    let profileImage: String
    let commentsCount: Int
    let timeAgoPosted, userProfileName, feedImageCaption: String
}

struct HomeStory: Codable {
    let name: String
    let image: String
    let isStoryView: Bool
}
