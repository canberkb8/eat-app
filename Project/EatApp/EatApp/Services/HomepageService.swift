//
//  HomepageService.swift
//  EatApp
//
//  Created by Canberk Bibican on 1.09.2022.
//

import Foundation
import ENetwork

protocol HomepageServiceProtocol {
    func getCategory(completion: @escaping ((Result<CategoryResponse, Error>) -> Void))
    func getDiscount(completion: @escaping ((Result<DiscountResponse, Error>) -> Void))
    func getRecommend(completion: @escaping ((Result<RecommendResponse, Error>) -> Void))
    func getRestuarantList(completion: @escaping ((Result<RestuarantListResponse, Error>) -> Void))
}

class HomepageService: HomepageServiceProtocol {

    func getCategory(completion: @escaping ((Result<CategoryResponse, Error>) -> Void)) {
        Network.shared.request(ServiceRouter.category, loading: false) { result in
            completion(result)
        }
    }

    func getDiscount(completion: @escaping ((Result<DiscountResponse, Error>) -> Void)) {
        Network.shared.request(ServiceRouter.discount, loading: false) { result in
            completion(result)
        }
    }

    func getRecommend(completion: @escaping ((Result<RecommendResponse, Error>) -> Void)) {
        Network.shared.request(ServiceRouter.recommend, loading: false) { result in
            completion(result)
        }
    }

    func getRestuarantList(completion: @escaping ((Result<RestuarantListResponse, Error>) -> Void)) {
        Network.shared.request(ServiceRouter.restuarant, loading: false) { result in
            completion(result)
        }
    }
}
