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
        case redirectSignUp
        
        var stringValue: String {
            switch self {
            case .session:
                return Endpoints.base + "session"
            case .studentLocation:
                return Endpoints.base + "StudentLocation?order=-updatedAt&limit=100"
            case .users(let id):
                return Endpoints.base + "users/" + id
            case .redirectSignUp:
                return "https://auth.udacity.com/sign-up"
            }
        }
        var url: URL{
            return URL(string: stringValue)!
        }
    }
    
    class func exampleOfAGet(){
        let authAPI = Endpoints.studentLocation.url
        _ = URLSession.shared.dataTask(with: authAPI) { (data, response, error) in
            guard let data = data else {
                return
            }
            let decoder = JSONDecoder()
            let studentsLocation = try! decoder.decode(StudentsLocationResponse.self, from: data)
            print(studentsLocation)
//            print(String(data: data, encoding: .utf8)!)
            }.resume()
    }

    // LOGIN TASK
    class func authenticationPOST(username: String, password: String, completion: @escaping (Bool, Error?) -> Void){
        // create an instance of the AuthenticationRequest struct with your own values
        let body = AuthenticationRequest(udacity: Credentials(username: username, password: password))
        var request = URLRequest(url: Endpoints.session.url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // encoding a JSON body from a string, can also use a Codable struct
        request.httpBody = try! JSONEncoder().encode(body)
        
        _ = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(false, error)
                }
                return
            }
            let decoder = JSONDecoder()
            do {
                _ = try decoder.decode(AuthenticationResponse.self, from: data.subdata(in: 5..<data.count))
                completion(true, nil)
            } catch {
                do{
                    let errorResponse = try decoder.decode(ErrorResponse.self, from: data.subdata(in: 5..<data.count))
                    DispatchQueue.main.async {
                        completion(false, errorResponse)
                    }
                }
                catch {
                    DispatchQueue.main.async {
                        completion(false, error)
                    }
                }
            }
            }.resume()
    }
    
    // LOGOUT TASK
    class func authenticationDELETE(completion: @escaping (Bool, Error?) -> Void){
        var request = URLRequest(url: Endpoints.session.url)
        request.httpMethod = "DELETE"
        
        var xsrfCookie: HTTPCookie? = nil
        let sharedCookieStorage = HTTPCookieStorage.shared
        
        for cookie in sharedCookieStorage.cookies! {
            if cookie.name == "XSRF-TOKEN" { xsrfCookie = cookie }
        }
        
        if let xsrfCookie = xsrfCookie {
            request.setValue(xsrfCookie.value, forHTTPHeaderField: "X-XSRF-TOKEN")
        }
        
        let _ = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                completion(false, error)
                return
            }
            do {
                let decoder = JSONDecoder()
                _ = try decoder.decode(LogoutRequest.self, from: data.subdata(in: 5..<data.count))
                completion(true, nil)
            } catch {
                completion(false, error)
            }
            }
            .resume()
    }
}
