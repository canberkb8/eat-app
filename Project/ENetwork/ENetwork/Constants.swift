//
//  Constants.swift
//  Network
//
//  Created by Canberk Bibican on 28.08.2022.
//

import Foundation

//The header fields
public enum HttpHeaderField: String {
    case contentType = "Content-Type"
    case accept = "Accept"
}

//The content type (JSON)
public enum ContentType: String {
    case json = "application/json"
}
