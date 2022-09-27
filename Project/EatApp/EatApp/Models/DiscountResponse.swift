//
//  DiscountResponse.swift
//  EatApp
//
//  Created by Canberk Bibican on 1.09.2022.
//

import Foundation

struct DiscountResponse : Codable, Hashable {
    let title : String?
    let discount : [Discount]?

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case discount = "discount_list"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        discount = try values.decodeIfPresent([Discount].self, forKey: .discount)
    }

}

struct Discount : Codable, Hashable {
    let id : Int?
    let restaurantId : Int?
    let title : String?
    let description : String?
    let image : String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case restaurantId = "restaurant_id"
        case title = "title"
        case description = "description"
        case image = "image"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        restaurantId = try values.decodeIfPresent(Int.self, forKey: .restaurantId)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        image = try values.decodeIfPresent(String.self, forKey: .image)
    }

}
