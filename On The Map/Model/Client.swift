//
//  Client.swift
//  On The Map
//
//  Created by Michal Hus on 2/20/20.
//  Copyright © 2020 Michal Hus. All rights reserved.
//

import Foundation

class Client {
    
    enum Endpoints {
        static let base = "https://onthemap-api.udacity.com/v1/"
        
        case session
        case studentLocation
        case users
        
        var stringValue: String {
            switch self {
            case .session:
                return Endpoints.base + "session"
            case .studentLocation:
                return Endpoints.base + "StudentLocation"
            case .users:
                return Endpoints.base + "users/"
//        https://onthemap-api.udacity.com/v1/users/<user_id>

            }
            
        }
        
        
        
    }
    
}
