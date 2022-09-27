//
//  ServiceRouter.swift
//  EatApp
//
//  Created by Canberk Bibican on 1.09.2022.
//

import Foundation
import Alamofire
import ENetwork

public enum ServiceRouter: NetworkConfiguration {
    case category
    case discount
    case recommend
    case restuarant

    // MARK: - HTTPMethod
    public var method: HTTPMethod {
        switch self {
        case .category, .discount, .recommend, .restuarant:
            return .get
        }
    }

    // MARK: - Path
    public var path: String {
        switch self {
        case .category:
            return "/category.json"
        case .discount:
            return "/discount.json"
        case .recommend:
            return "/recommend.json"
        case .restuarant:
            return "/restuarant.json"
        }
    }

    // MARK: - Parameters
    public var parameters: Parameters? {
        switch self {
//        case .restuarant(let restuarantRequest):
//            return restuarantRequest
        default: return nil
        }
    }

    // MARK: - URLRequestConvertible
    public func asURLRequest() throws -> URLRequest {
        let url = try ("https://raw.githubusercontent.com/canberkb8/eat-app/master/MockApi").asURL()

        var urlRequest = URLRequest(url: url.appendingPathComponent(path))

        // HTTP Method
        urlRequest.httpMethod = method.rawValue

        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HttpHeaderField.contentType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HttpHeaderField.accept.rawValue)

        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }

        return urlRequest
    }
}
