//
//  swiftUI_KakaoLoginApp.swift
//  swiftUI_KakaoLogin
//
//  Created by 어재선 on 12/1/24.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

@main
struct swiftUI_KakaoLoginApp: App {
    init () {
        let kakaoAppKey = Bundle.main.infoDictionary?["KAKAO_NAITIVE_APP_KEY"] ?? ""
        KakaoSDK.initSDK(appKey: kakaoAppKey as! String)
    }
    var body: some Scene {
        WindowGroup {
            LoginView()
                .onOpenURL { url in
                    if (AuthApi.isKakaoTalkLoginUrl(url)) {
                        _ = AuthController.handleOpenUrl(url: url)
                    }
                }
        }
    }
}
