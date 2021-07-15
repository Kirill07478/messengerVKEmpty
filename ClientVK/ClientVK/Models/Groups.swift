//
//  Groups.swift
//  ClientVK
//
//  Created by Kiryusha Orlov on 06.07.2021.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let groups = try? newJSONDecoder().decode(Groups.self, from: jsonData)

import Foundation

// MARK: - Groups
class Groups: Codable {
    let response: ResponseGroup

    init(response: ResponseGroup) {
        self.response = response
    }
}

// MARK: - Response
class ResponseGroup: Codable {
    let count: Int
    let items: [Group]

    init(count: Int, items: [Group]) {
        self.count = count
        self.items = items
    }
}

// MARK: - Item
class Group: Codable {
    let isMember, id: Int
    let photo100: String
    let isAdvertiser, isAdmin: Int
    let photo50, photo200: String
    let type: TypeEnum
    let screenName, name: String
    let isClosed: Int

    enum CodingKeys: String, CodingKey {
        case isMember = "is_member"
        case id
        case photo100 = "photo_100"
        case isAdvertiser = "is_advertiser"
        case isAdmin = "is_admin"
        case photo50 = "photo_50"
        case photo200 = "photo_200"
        case type
        case screenName = "screen_name"
        case name
        case isClosed = "is_closed"
    }

    init(isMember: Int, id: Int, photo100: String, isAdvertiser: Int, isAdmin: Int, photo50: String, photo200: String, type: TypeEnum, screenName: String, name: String, isClosed: Int) {
        self.isMember = isMember
        self.id = id
        self.photo100 = photo100
        self.isAdvertiser = isAdvertiser
        self.isAdmin = isAdmin
        self.photo50 = photo50
        self.photo200 = photo200
        self.type = type
        self.screenName = screenName
        self.name = name
        self.isClosed = isClosed
    }
}

enum TypeEnum: String, Codable {
    case event = "event"
    case group = "group"
    case page = "page"
}
