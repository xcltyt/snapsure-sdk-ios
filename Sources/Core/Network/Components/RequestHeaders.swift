//
//  RequestHeaders.swift
//  SnapsureSDK
//
//  Created by Artem Novichkov on 10/03/2017.
//  Copyright © 2017 Snapsure. All rights reserved.
//

import Foundation

/// The enum for request headers.
///
/// - authorization: Authorization header. Adds token from parameter with "Bearer" keyword
/// - multipartData: Header for data uploading. Adds "multipart/form-data" and random generated boundary.
enum RequestHeaders {
    
    case authorization(String)
    case multipartData
    
    var key: String {
        switch self {
        case .authorization: return "Authorization"
        case .multipartData: return "Content-Type"
        }
    }
    
    var value: String {
        switch self {
        case .authorization(let token): return "Bearer \(token)"
        case .multipartData: return "multipart/form-data; boundary=\(NSUUID().uuidString)"
        }
    }
}
