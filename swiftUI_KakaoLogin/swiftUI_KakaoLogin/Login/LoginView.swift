//
//  ContentView.swift
//  swiftUI_KakaoLogin
//
//  Created by 어재선 on 12/1/24.
//

import SwiftUI
import KakaoSDKAuth
import KakaoSDKUser
import KakaoSDKCommon

struct LoginView: View {
    @StateObject private var logineViewModel = LoginViewModel()
    var body: some View {
        VStack {
            Button {
                logineViewModel.login()
                
            } label: {
                Text("카카오톡 로그인")
            }
            
            if logineViewModel.islogined {
                Text("로그인 성공")
            }
    
        }
        .padding()
    }
}

#Preview {
    LoginView()
}
