//
//  LoginRequest.swift
//  On The Map
//
//  Created by Michal Hus on 2/20/20.
//  Copyright © 2020 Michal Hus. All rights reserved.
//

import Foundation

struct Authentication: Codable {
    let username: String
    let password: String
}
