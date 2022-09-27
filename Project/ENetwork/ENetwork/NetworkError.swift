//
//  NetworkError.swift
//  Network
//
//  Created by Canberk Bibican on 28.08.2022.
//

import Foundation

public enum NetworkError: Error {
    case systemError
    case notFound
    case unexpected(code: Int)
    case internetConnection
}

extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .systemError:
            return NSLocalizedString(
                "An unexpected system error has occurred.",
                comment: "System Error"
            )
        case .notFound:
            return NSLocalizedString(
                "The specified item could not be found.",
                comment: "Resource Not Found"
            )
        case .unexpected(code: let code):
            switch code {
            case 400: return NSLocalizedString(
                    "Bad request.",
                    comment: "Bad Request"
                )
            case 404 : return NSLocalizedString(
                "Not Found.",
                comment: "Not Found"
            )
            default:
                return NSLocalizedString(
                    "An unexpected error occurred.",
                    comment: "Unexpected Error"
                )
            }
        case .internetConnection:
            return NSLocalizedString(
                "There was a problem with your internet connection.",
                comment: "Connection Error"
            )
        }
    }
}
