//
//  ENetwork.swift
//  Network
//
//  Created by Canberk Bibican on 28.08.2022.
//

import Foundation
import Alamofire

public final class Network {

    public static let shared = Network()
    static let networkIndicator = NetworkIndicator()

    public func request<T: Decodable>(_ urlConvertible: URLRequestConvertible, loading: Bool = true, completion: @escaping (Result<T, Error>) -> Void) {
        if loading { Network.networkIndicator.changeShow(true) }
        if Connectivity.isConnectedToInternet {
            AF.request(urlConvertible).validate(statusCode: 200..<300).responseDecodable { (response: AFDataResponse<T>) in
                if loading { Network.networkIndicator.changeShow(false) }
                switch response.result {
                case .success(let responseData):
                    completion(.success(responseData))
                case .failure(let error):
                    if (response.response?.statusCode != nil) {
                        print(response.response!.statusCode)
                        completion(.failure(NetworkError.unexpected(code: response.response!.statusCode)))
                    } else {
                        completion(.failure(error))
                    }
                }
            }
        } else {
            if loading { Network.networkIndicator.changeShow(false) }
            completion(.failure(NetworkError.internetConnection))
        }
    }

    struct Connectivity {
        static let sharedInstance = NetworkReachabilityManager()!
        static var isConnectedToInternet: Bool {
            return self.sharedInstance.isReachable
        }
    }
}
