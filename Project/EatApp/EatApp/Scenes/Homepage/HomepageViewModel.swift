//
//  HomepageViewModel.swift
//  EatApp
//
//  Created by Canberk Bibican on 29.08.2022.
//

import Foundation

protocol HomepageViewModelProtocol {
    func setDelegate(viewControllerProtocol: HomepageViewControllerProtocol)
    var discountData: DiscountResponse? { get }
    var categoryData: CategoryResponse? { get }
    var recommendData: RecommendResponse? { get }
    var restuarantListData: RestuarantListResponse? { get }
}

final class HomepageViewModel: HomepageViewModelProtocol {

    private var viewControllerProtocol: HomepageViewControllerProtocol?
    var homepageService: HomepageServiceProtocol?

    var discountData: DiscountResponse?
    var categoryData: CategoryResponse?
    var recommendData: RecommendResponse?
    var restuarantListData: RestuarantListResponse?

    func setDelegate(viewControllerProtocol: HomepageViewControllerProtocol) {
        self.viewControllerProtocol = viewControllerProtocol
    }

    init(homepageService: HomepageServiceProtocol) {
        self.homepageService = homepageService
        getDiscount()
        getCategory()
        getRecommend()
        getRestuarantList()
    }

    func getDiscount() {
        homepageService?.getDiscount(completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let discountResponse):
                self.discountData = discountResponse
                self.viewControllerProtocol?.discountDataSuccess()
            case .failure(let error):
                self.viewControllerProtocol?.discountDataError(error: error)
            }
        })
    }

    func getCategory() {
        homepageService?.getCategory(completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let categoryResponse):
                self.categoryData = categoryResponse
                self.viewControllerProtocol?.categoryDataSuccess()
            case .failure(let error):
                self.viewControllerProtocol?.categoryDataError(error: error)
            }
        })
    }

    func getRecommend() {
        homepageService?.getRecommend(completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let recommendResponse):
                self.recommendData = recommendResponse
                self.viewControllerProtocol?.recommendDataSuccess()
            case .failure(let error):
                self.viewControllerProtocol?.recommendDataError(error: error)
            }
        })
    }

    func getRestuarantList() {
        homepageService?.getRestuarantList(completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let restuarantListResponse):
                self.restuarantListData = restuarantListResponse
                self.viewControllerProtocol?.restuarantListDataSuccess()
            case .failure(let error):
                self.viewControllerProtocol?.restuarantListDataError(error: error)
            }
        })
    }

}
