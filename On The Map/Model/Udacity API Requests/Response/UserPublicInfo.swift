//
//  UserPublicInfo.swift
//  On The Map
//
//  Created by Michal Hus on 2/25/20.
//  Copyright © 2020 Michal Hus. All rights reserved.
//

import Foundation

struct UserPublicInfo: Codable {
    let firstName: String
    let lastName: String
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
    }
}

