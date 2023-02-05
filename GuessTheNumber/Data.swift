//
//  Data.swift
//  GuessTheNumber
//
//  Created by Jorge Giannotta on 09/05/21.
//

import SwiftUI

struct User : Codable, Identifiable {
    let id = UUID()
    let name: String
    let username: String
    let email: String
}

class Api {
    func getUser(completion: @escaping ([User]) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let users = try! JSONDecoder().decode([User].self, from: data!)
            
            DispatchQueue.main.async {
                completion(users)
            }
        }
    .resume()
    }
}
