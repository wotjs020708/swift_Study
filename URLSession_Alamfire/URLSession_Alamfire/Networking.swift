//
//  Networking.swift
//  URLSession_Alamfire
//
//  Created by 어재선 on 9/26/24.
//

import Foundation
import Alamofire

class networkingClass: ObservableObject {
    @Published var randomUser = [RandomUser]()
    
    func alamofireNetworking(url: String) {
        //MARK: URL생성, guard let으로 옵셔널 검사
        guard let sessionUrl = URL(string: url) else {
            print("Invalid URL")
            return
        }
        
        //MARK: Request생성
        AF.request(sessionUrl,
                   method: .get, // HTTP메서드 설정
                   parameters: nil, // 파라미터 설정
                   encoding: URLEncoding.default, // 인코딩 타입 설정
                   headers: ["Content-Type":"application/json", "Accept":"application/json"]) // 헤더 설정
            .validate(statusCode: 200..<300) // 유효성 검사
            //MARK: responseDecodable을 통해 UserDatas form으로 디코딩, response의 성공 여부에 따라 작업 분기
            .responseDecodable (of: UserDatas.self) { response in
                switch response.result {
                case .success(let value):
                    self.randomUser = value.results
                case .failure(let error):
                    print(error)
                }
            }
    }
    
}
