//
//  NetworkManager.swift
//  CleanSwiftStarter
//
//  Created by David on 6/20/18.
//  Copyright © 2018 David Velarde. All rights reserved.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private let baseURL = "https://jsonplaceholder.typicode.com"
    private init() {}
    
    func getPosts(completionHandler: @escaping ([Post]) -> Void ) {
        
        let url = URL(string: baseURL + "/posts")!
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            let arrayPosts = [Post]()
            
            DispatchQueue.main.async {
                if let data = data {
                    let decoder = JSONDecoder()
                    do {
                        let decodedPosts = try decoder.decode([Post].self, from: data)
                        print("Decode:")
                        print(decodedPosts)
                        completionHandler(decodedPosts)
                    } catch {
                        completionHandler(arrayPosts)
                    }
                }
            }
        }
        
        dataTask.resume()
    }
    
    func getCommentsForPost(withPostId postId:String, completionHandler: @escaping ([Comment]) -> Void ) {
        
        let url = URL(string: baseURL + "/posts/" + postId + "/comments")!
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            let arrayComments = [Comment]()
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let decodedComments = try decoder.decode([Comment].self, from: data)
                    completionHandler(decodedComments)
                } catch {
                    completionHandler(arrayComments)
                }
            }
        }
        
        dataTask.resume()
    }
}
