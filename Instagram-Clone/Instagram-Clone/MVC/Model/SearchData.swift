//
//  SearchData.swift
//  Instagram-Clone
//
//  Created by Muhammad Waleed on 12.01.2024.
//

import Foundation

struct SearchData: Codable {
    let imagesCollection: [String]

    enum CodingKeys: String, CodingKey {
        case imagesCollection = "ImagesCollection"
    }
}
