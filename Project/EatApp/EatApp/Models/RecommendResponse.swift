//
//  RecommendResponse.swift
//  EatApp
//
//  Created by Canberk Bibican on 1.09.2022.
//

import Foundation

struct RecommendResponse : Codable, Hashable {
    let title : String?
    let recommendedList : [Restuarant]?

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case recommendedList = "recommended_list"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        recommendedList = try values.decodeIfPresent([Restuarant].self, forKey: .recommendedList)
    }

}
