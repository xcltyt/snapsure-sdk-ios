//
//  SnapsureErrors.swift
//  Snapsure
//
//  Created by Artem Novichkov on 11/03/2017.
//  Copyright © 2017 Snapsure. All rights reserved.
//

public enum SnapsureErrors: Error {
    
    case cannotRecognize
    
    public enum TokenErrors: Error {
        case missingToken
        case invalidToken
    }
    
    public enum NetworkErrors: Error {
        case emptyServerData
        case cannotParseResponse
    }
    
    public enum ImageErrors: Error {
        case unsupportedBitmapFormat
        case bigSize
    }
    
    public enum LookupErrors: Error {
        case timeout
    }
}

extension SnapsureErrors: LocalizedError {
    
    public var errorDescription: String? {
        switch self {
        case .cannotRecognize: return "The image can not be recognized."
        }
    }
}

extension SnapsureErrors.TokenErrors: LocalizedError {
    
    public var errorDescription: String? {
        switch self {
        case .missingToken: return "Missing token. Please call `Snapsure.configure(withApiKey:)` function with your API key."
            case .invalidToken: return "Unauthorized. Please check your API key."
        }
    }
}

extension SnapsureErrors.NetworkErrors: LocalizedError {
    
    public var errorDescription: String? {
        switch self {
        case .emptyServerData: return "Server has sent empty data for request."
        case .cannotParseResponse: return "Server has sent incorrect response."
        }
    }
}

extension SnapsureErrors.ImageErrors: LocalizedError {
    
    public var errorDescription: String? {
        switch self {
        case .unsupportedBitmapFormat: return "Selected image has unsupported bitmap format."
        case .bigSize: return "Selected image has big size."
        }
    }
}
