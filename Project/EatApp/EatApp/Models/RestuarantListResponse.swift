//
//  RestuarantResponse.swift
//  EatApp
//
//  Created by Canberk Bibican on 1.09.2022.
//

import Foundation

struct RestuarantListResponse: Codable, Hashable {
    let title: String?
    let restuarantList: [Restuarant]?
    let currentPage: Int?
    let maxPage: Int?

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case restuarantList = "restuarant_list"
        case currentPage = "current_page"
        case maxPage = "max_page"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        restuarantList = try values.decodeIfPresent([Restuarant].self, forKey: .restuarantList)
        currentPage = try values.decodeIfPresent(Int.self, forKey: .currentPage)
        maxPage = try values.decodeIfPresent(Int.self, forKey: .maxPage)
    }

}
