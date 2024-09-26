//
//  Model.swift
//  URLSession_Alamfire
//
//  Created by 어재선 on 9/26/24.
//

import Foundation

struct UserDatas : Codable {
    var results: [RandomUser]
}

struct RandomUser: Codable, Identifiable {
    let id: UUID = UUID()
    let name: Name
    let email: String
    
    struct Name: Codable {
        var title: String
        var first: String
        var last: String
        
        var full: String {
            return "\(self.title.capitalized).\(self.last.capitalized) \(self.first.capitalized)"

        }
    }
    
    static func getDummy() -> Self {
            return RandomUser(name: Name.init(title: "MR", first: "Minhyun", last: "Cho"), email: "simh3077@gmail.com")
        }
    
}
