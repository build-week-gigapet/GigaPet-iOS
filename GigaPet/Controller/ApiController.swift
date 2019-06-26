//
//  SignUpSignInController.swift
//  GigaPet Wire Frame
//
//  Created by Jake Connerly on 6/24/19.
//  Copyright © 2019 jake connerly. All rights reserved.
//

import Foundation
import UIKit

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
// MARK: - Beginning of APIController Class
//

class ApiController {
    
    //
    //MARK: - Properties
    //
    
    private let baseUrl = URL(string: "http://bw-gigapet.herokuapp.com/")!
    var bearer: Bearer?
    var children: [Child] = []
    var childDetailArray: [ChildDetail] = []
    
    //
    // MARK: - SignUp Function
    //
    
    func signUp(with user: User, completion: @escaping (Error?) -> ()) {
        let signUpUrl = baseUrl.appendingPathComponent("createnewuser")
        
        var request = URLRequest(url: signUpUrl)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
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
        
        let signInUrl = baseUrl.appendingPathComponent("ADDED PLACEHOLDER FOR ENDPOINT")
        
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
    
    //
    // MARK: - Fetch all children Function
    //
    
    func fetchAllChildren(completion: @escaping (Result<[Child], NetWorkError>) -> Void) {
        guard let bearer = bearer else {
            completion(.failure(.noAuth))
            return
        }
        let allChildrenUrl = baseUrl.appendingPathComponent("ADDED PLACEHOLDER FOR ENDPOINT")
            completion(.failure(.otherError))

        
        var request = URLRequest(url: allChildrenUrl)
        request.httpMethod = HTTPMethod.get.rawValue
        request.addValue("ADDED PLACEHOLDER FOR BEARER TOKEN \(bearer.token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let response = response as? HTTPURLResponse,
                response.statusCode == 401 {
                completion(.failure(.badAuth))
                return
            }
            
            if let _ = error {
                completion(.failure(.otherError))
                return
            }
            
            guard let data = data else {
                completion(.failure(.badData))
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let children = try decoder.decode([Child].self, from: data)
                completion(.success(children))
            }catch {
                completion(.failure(.noDecode))
                return
            }
        }.resume()
    }
    
    //
    // MARK: - Add Child
    //
    
    func addChild (newChild: Child, completion: @escaping(Error?) -> Void) {
        
        guard let bearer = bearer else {
            print("Error getting token")
            return
        }
        
        let newChildUrl = baseUrl.appendingPathComponent("ADDED PLACEHOLDER FOR ENDPOINT")
        
        var request = URLRequest(url: newChildUrl)
        request.httpMethod = HTTPMethod.post.rawValue
        request.addValue("ADDED PLACEHOLER \(bearer.token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let jsonEncoder = JSONEncoder()
        
        do {
            let jsonData = try jsonEncoder.encode(newChild)
            request.httpBody = jsonData
        }catch {
            print("error Encoding Data")
        }
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
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
                print("error no data")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let newChild = try decoder.decode(Child.self, from: data)
                self.children.append(newChild)
            }catch {
                completion(error)
            }
        }
    }
    
    func addFoodItem (foodItem: FoodEntry, completion: @escaping(Error?) -> Void) {
        
        
    }
}
