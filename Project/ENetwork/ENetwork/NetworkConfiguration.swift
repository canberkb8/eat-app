//
//  NetworkConfiguration.swift
//  Network
//
//  Created by Canberk Bibican on 28.08.2022.
//

import Foundation
import Alamofire

public protocol NetworkConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
}
