//
//  Photos.swift
//  ClientVK
//
//  Created by Kiryusha Orlov on 07.07.2021.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let photos = try? newJSONDecoder().decode(Photos.self, from: jsonData)

import Foundation

// MARK: - Photos
class Photos: Codable {
    let response: ResponsePhotos

    init(response: ResponsePhotos) {
        self.response = response
    }
}

// MARK: - Response
class ResponsePhotos: Codable {
    let count: Int
    let items: [Photo]

    init(count: Int, items: [Photo]) {
        self.count = count
        self.items = items
    }
}

// MARK: - Item
class Photo: Codable {
    let id: Int
    let photo807, photo1280: String
    let width: Int
    let likes: Likes
    let photo604: String
    let reposts: Reposts
    let photo130: String
    let date, ownerID: Int
    let text: String
    let height: Int
    let hasTags: Bool
    let albumID: Int
    let photo75: String

    enum CodingKeys: String, CodingKey {
        case id
        case photo807 = "photo_807"
        case photo1280 = "photo_1280"
        case width, likes
        case photo604 = "photo_604"
        case reposts
        case photo130 = "photo_130"
        case date
        case ownerID = "owner_id"
        case text, height
        case hasTags = "has_tags"
        case albumID = "album_id"
        case photo75 = "photo_75"
    }

    init(id: Int, photo807: String, photo1280: String, width: Int, likes: Likes, photo604: String, reposts: Reposts, photo130: String, date: Int, ownerID: Int, text: String, height: Int, hasTags: Bool, albumID: Int, photo75: String) {
        self.id = id
        self.photo807 = photo807
        self.photo1280 = photo1280
        self.width = width
        self.likes = likes
        self.photo604 = photo604
        self.reposts = reposts
        self.photo130 = photo130
        self.date = date
        self.ownerID = ownerID
        self.text = text
        self.height = height
        self.hasTags = hasTags
        self.albumID = albumID
        self.photo75 = photo75
    }
}

// MARK: - Likes
class Likes: Codable {
    let userLikes, count: Int

    enum CodingKeys: String, CodingKey {
        case userLikes = "user_likes"
        case count
    }

    init(userLikes: Int, count: Int) {
        self.userLikes = userLikes
        self.count = count
    }
}

// MARK: - Reposts
class Reposts: Codable {
    let count: Int

    init(count: Int) {
        self.count = count
    }
}
