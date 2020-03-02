//
//  AddStudentLocationPOST.swift
//  On The Map
//
//  Created by Michal Hus on 2/24/20.
//  Copyright © 2020 Michal Hus. All rights reserved.
//

import Foundation

struct AddStudentLocationPOSTRequest: Codable {
    let uniqueKey: String
    let firstName: String
    let lastName: String
    let mapString: String
    let mediaURL: String
    let latitude: Double
    let longitude: Double
}
