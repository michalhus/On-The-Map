//
//  LogoutRequest.swift
//  On The Map
//
//  Created by Michal Hus on 2/21/20.
//  Copyright © 2020 Michal Hus. All rights reserved.
//

import Foundation

struct LogoutRequest: Codable {
    let session: Logout
}

struct Logout: Codable {
    let id: String
    let expiration: String
}
