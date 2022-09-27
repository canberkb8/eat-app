//
//  CategoryResponse.swift
//  EatApp
//
//  Created by Canberk Bibican on 1.09.2022.
//

import Foundation

struct CategoryResponse: Codable, Hashable {
    let title: String?
    let category: [Category]?

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case category = "category_list"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        category = try values.decodeIfPresent([Category].self, forKey: .category)
    }

}

struct Category: Codable, Hashable {
    let id: Int?
    let iconImage: String?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case iconImage = "icon_image"
        case name = "name"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        iconImage = try values.decodeIfPresent(String.self, forKey: .iconImage)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }

}
