//
//  StudentLocationResponse.swift
//  On The Map
//
//  Created by Michal Hus on 2/24/20.
//  Copyright © 2020 Michal Hus. All rights reserved.
//

import Foundation

struct StudentsLocationResponse: Codable {
    let results: [Student]
}

struct Student: Codable {
    let createdAt: String
    let firstName: String
    let lastName: String
    let latitude: Double
    let longitude: Double
    let mapString: String
    let mediaURL: String
    let objectId: String
    let uniqueKey: String
    let updatedAt: String
}
