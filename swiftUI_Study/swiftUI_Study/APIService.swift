//
//  APIService.swift
//  swiftUI_Study
//
//  Created by 어재선 on 9/26/24.
//

import Foundation
import Alamofire

class APIService {
    
    let baseURL = URL(string:"http://swiftapi.rubypaper.co.kr:2029/hoppin/movies")!
    // version=1&page=1&count=30&genreId=&order=releasedateasc
    let parameters: [String: Any] = ["version":"1", "page": "1", "count": "30", "genreId" : "", "order": "releasedateasc"]
    
    func getTest() {
        AF.request(baseURL,
                   method: .get,
                   parameters: parameters,
                   encoding: URLEncoding.default,
                   headers: nil)
        .validate(statusCode: 200..<300)
        .responseDecodable(of: Movie.self){ response in
            
            switch response.result {
                case .success(let value):
                print(value)
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
}
