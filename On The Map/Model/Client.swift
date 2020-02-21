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
        case users(String)
        
        var stringValue: String {
            switch self {
            case .session:
                return Endpoints.base + "session"
            case .studentLocation:
                return Endpoints.base + "StudentLocation"
            case .users(let id):
                return Endpoints.base + "users/" + id
            }
        }
        var url: URL{
            return URL(string: stringValue)!
        }
    }
    
    class func exampleOfAGet(){
        let authAPI = Endpoints.session.url
        let task = URLSession.shared.dataTask(with: authAPI) { (data, response, error) in
            guard let data = data else {
                return
            }
            let decoder = JSONDecoder()
            let authData = try! decoder.decode(AuthenticationResponse.self, from: data)
            print(authData)
            print(data)
        }
        task.resume()
    }
    
    class func exampleOfAPost(username: String, password: String){
        // create an instance of the Post struct with your own values
        let credentials = AuthenticationRequest(udacity: Credentials(username: username, password: password))
        var request = URLRequest(url: Endpoints.session.url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // encoding a JSON body from a string, can also use a Codable struct
        request.httpBody = try! JSONEncoder().encode(credentials)
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            if error != nil { // Handle error…
                return
            }
            
            let range =  5..<data!.count
            let newData = data?.subdata(in: range) /* subset response data! */
            print(String(data: newData!, encoding: .utf8)!)
        }
        task.resume()
    }
    
}
