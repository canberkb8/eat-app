//
//  RestuarantResponse.swift
//  EatApp
//
//  Created by Canberk Bibican on 1.09.2022.
//

import Foundation
struct Restuarant: Codable, Hashable {
    let id: Int?
    let image: String?
    let rating: Double?
    let ratingCount: Int?
    let favorite: Bool?
    let title: String?
    let deliveryTime: Int?
    let deliveryPrice: String?
    let open: Bool?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case image = "image"
        case rating = "rating"
        case ratingCount = "rating_count"
        case favorite = "favorite"
        case title = "title"
        case deliveryTime = "delivery_time"
        case deliveryPrice = "delivery_price"
        case open = "open"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        rating = try values.decodeIfPresent(Double.self, forKey: .rating)
        ratingCount = try values.decodeIfPresent(Int.self, forKey: .ratingCount)
        favorite = try values.decodeIfPresent(Bool.self, forKey: .favorite)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        deliveryTime = try values.decodeIfPresent(Int.self, forKey: .deliveryTime)
        deliveryPrice = try values.decodeIfPresent(String.self, forKey: .deliveryPrice)
        open = try values.decodeIfPresent(Bool.self, forKey: .open)
    }

}
