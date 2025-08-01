//
//  MainView.swift
//  TCA_Simple_Component
//
//  Created by 어재선 on 7/29/25.
//

import SwiftUI
import ComposableArchitecture

struct MainView: View {
    let store: StoreOf<MainFeature>
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                // 제목
                Text("TCA 여러 컴퍼넌트 예제")
                    .font(.largeTitle)
                    .bold()
                
                // 전체 상태 표시
                Text("총 카운트: \(store.totalCount)")
                    .font(.title2)
                    .padding()
                    .background(.yellow.opacity(0.3))
                    .cornerRadius(8)
                
                // 1. 첫 번쨰 카운터 컴포넌트
                CounterComponent(
                    title: "첫 번째 카운트",
                    count: store.counter1,
                    onIncrement: {store.send(.counter1Increment)},
                    onDecrement: {store.send(.counter1Decrement)}
                )
                // 2. 두 번째 카운터 컴포넌트
                CounterComponent(
                    title: "두 번째 카운트",
                    count: store.counter2,
                    onIncrement: {store.send(.counter2Increment)},
                    onDecrement: {store.send(.counter2Decrement)}
                )
                
                // 3. 사용자 정보 컴포넌트
                UserInfoComponent(
                    name: store.userName,
                    email: store.userEmail,
                    isOnline: store.isUserOnline,
                    onEditTap: { store.send(.editUserTapped) }
                )
                
                // 온라인 상태 토글 버튼 (추가 가능)
                Button("온라인 상태 토글") {
                    store.send(.toggleUserOnlineStatus)
                }
                .padding()
                .background(.purple)
                .foregroundStyle(.white)
                .cornerRadius(8)
                
                // 4. 로딩 컴포넌트
                LoadingComponent(
                    isLoading: store.isLoading,
                    message: store.loadMessage,
                    onLoadTap: { store.send(.loadDataTapped) }
                )
                
                // 전체 리셋 버튼
                Button("전체 리셋") {
                    store.send(.resetAll)
                }
                .padding()
                .background(.red)
                .foregroundStyle(.white)
                .cornerRadius(8)
                Spacer(minLength: 50)
                
            }
            .padding()
        }
    }
}
