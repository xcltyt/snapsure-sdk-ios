//
//  SnapsureErrors.swift
//  SnapsureSDK
//
//  Created by Artem Novichkov on 11/03/2017.
//  Copyright © 2017 Snapsure. All rights reserved.
//

enum SnapsureErrors: Error {
    
    enum ImageErrors: Error {
        case unsupportedBitmapFormat
        case bigSize
    }
}