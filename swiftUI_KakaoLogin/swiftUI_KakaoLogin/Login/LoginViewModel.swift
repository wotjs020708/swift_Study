//
//  LoginViewModel.swift
//  swiftUI_KakaoLogin
//
//  Created by 어재선 on 12/1/24.
//

import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser
import Foundation

class LoginViewModel: ObservableObject {
    @Published var islogined: Bool = false
    
    
    
    
    func login() {
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk { (oauthToken, error) in
                
                if let error = error {
                    print(error)
                } else {
                    print("loginWithKakaoTalk() success.")
                    self.islogined = true
                    //do something
                    _ = oauthToken
                }
                
            }
        } else {
            UserApi.shared.loginWithKakaoAccount { (oauthToken, error) in
                
                print("loginWithKakaoAccount() success.")
                
                //do something
                _ = oauthToken
                self.islogined = true
            }
        }
    }
    
    func logout() {
        UserApi.shared.logout { (error) in
            if let error = error {
                print("error:",error)
            } else {
                print("logout() success.")
            }
        }
    }
    func getProfile() {
        UserApi.shared.me { (user, error) in
            if let error = error {
                print(error)
            } else {
                print ("me() success.")
                _ = user
            }
            
        }
    }
}
