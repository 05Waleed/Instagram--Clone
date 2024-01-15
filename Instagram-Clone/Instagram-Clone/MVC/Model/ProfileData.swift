//
//  ProfileData.swift
//  Instagram-Clone
//
//  Created by Muhammad Waleed on 12.01.2024.
//

import Foundation

struct ProfileData: Codable {
    let user: User
    let highlights: [Highlight]
    let userPostedImages: [UserPostedImage]
}

struct Highlight: Codable {
    let image: String
    let heading: String
}

struct User: Codable {
    let bio, username: String
    let followers, following, numberOfPosts: Int
    let profileImage: String

    enum CodingKeys: String, CodingKey {
        case bio, username, followers, following, numberOfPosts
        case profileImage = "profile_image"
    }
}

struct UserPostedImage: Codable {
    let image: String
    let caption: String?
}
