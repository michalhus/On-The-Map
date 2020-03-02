//
//  ErrorResponse.swift
//  On The Map
//
//  Created by Michal Hus on 2/22/20.
//  Copyright © 2020 Michal Hus. All rights reserved.
//

import Foundation

struct ErrorResponse: Codable {
    let status: Int
    let error: String  
}

extension ErrorResponse: LocalizedError {
    var errorDescription: String? {
        return error
    }
}
