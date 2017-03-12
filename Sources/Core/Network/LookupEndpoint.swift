//
//  LookupEndpoint.swift
//  SnapsureSDK
//
//  Created by Artem Novichkov on 10/03/2017.
//  Copyright © 2017 Snapsure. All rights reserved.
//

import Foundation

enum LookupEndpoint: Endpoint {
    
    case lookup(Int)
    
    var method: HTTPMethod {
        switch self {
        case .lookup: return .get
        }
    }
    
    var path: String {
        switch self {
        case .lookup(let identifier): return "3/lookup/\(identifier)"
        }
    }
}
