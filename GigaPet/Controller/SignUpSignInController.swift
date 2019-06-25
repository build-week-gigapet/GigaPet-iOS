//
//  SignUpSignInController.swift
//  GigaPet Wire Frame
//
//  Created by Jake Connerly on 6/24/19.
//  Copyright © 2019 jake connerly. All rights reserved.
//

import Foundation

//
// MARK: - HTTPMethod & Error enums
//

//added enum for HTTPMethod to prevent errors in request type
enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
}

enum NetWorkError: Error {
    case noAuth
    case badAuth
    case otherError
    case badData
    case noDecode
}

//
// MARK: - Beginning of SignUpSignInController Class
//

class SignUpSignInController {
    
    //
    //MARK: - Properties
    //
    
    private let baseUrl = URL(string: "ADDED PLACEHOLDER")
    var bearer: Bearer?
    
    //
    // MARK: - SignUp Function
    //
    
    func signUp(with user: User, completion: @escaping (Error?) -> ()) {
        guard let signUpUrl = baseUrl?.appendingPathComponent("") else { return }
        
        var request = URLRequest(url: signUpUrl)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("ADDED PLACEHOLDER", forHTTPHeaderField: "ADDED PLACEHOLDER")
        
        let jsonEncoder = JSONEncoder()
        do {
            let jsonData = try jsonEncoder.encode(user)
            request.httpBody = jsonData
        }catch {
            print("Error encoding user Object: \(error)")
            completion(error)
            return
        }
        
        URLSession.shared.dataTask(with: request) { _, response, error in
            if let response = response as? HTTPURLResponse,
                response.statusCode != 200 {
                completion(NSError(domain: "", code: response.statusCode, userInfo: nil))
                
                return
            }
            if let error = error {
                completion(error)
                return
            }
            completion(nil)
            }.resume()
    }
    
    //
    // MARK: - SignIn Function
    //
    
    func signIn(with user: User, completion: @escaping (Error?) -> ()) {
        guard let signInUrl = baseUrl?.appendingPathComponent("ADDED PLACEHOLDER FOR ENDPOINT") else {
            print("ERROR ASSIGING SIGNINURL LINE 86 SIGNUPSIGNINCONTROLLER")
            return
        }
        
        var request = URLRequest(url: signInUrl)
        request.httpMethod = HTTPMethod.post.rawValue //setting up ability to send info to api
        request.setValue("application/json", forHTTPHeaderField: "ADDEDPLACE HOLDER")
        
        let jsonEncoder = JSONEncoder()
        do {
            let jsonData = try jsonEncoder.encode(user) //user has to conform to codable
            request.httpBody = jsonData
        }catch{
            print("error encoding user object: \(error)")
            completion(error)
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let response = response as? HTTPURLResponse,
                response.statusCode != 200 { //error response 200 is OK or sucessful response
                completion(NSError(domain: "", code: response.statusCode, userInfo: nil))
                return
            }
            if let error = error {
                completion(error)
                return
            }
            
            guard let data = data else {
                completion(NSError())
                return
            }
            
            let decoder = JSONDecoder()
            do {
                self.bearer = try decoder.decode(Bearer.self, from: data)
            }catch {
                completion(error)
                return
            }
            
            completion(nil)
            }.resume()
    }
    
    
}
