//
//  AdvancedMainView.swift
//  TCA_Simple_Component
//
//  Created by 어재선 on 7/29/25.
//

import SwiftUI
import ComposableArchitecture

// MARK: - 단계 5: 고급 패턴 - 조건부 컴포넌트 표시
struct AdvancedMainView: View {
    let store: StoreOf<MainFeature>
    
    var body: some View {
        VStack(spacing: 20) {
            
            // 조검부 컴포넌트 표시
            if store.totalCount > 0 {
                Text("카운터가 활성화되었습니다!")
                    .foregroundStyle(.green)
                    .font(.headline)
            }
            
            // 상태에 따른 다른 컴포넌트 표시
            
            Group {
                if store.isLoading {
                    LoadingComponent(
                        isLoading: store.isLoading,
                        message: store.loadMessage,
                        onLoadTap: { store.send(.loadDataTapped)}
                    )
                } else {
                    VStack {
                        CounterComponent(
                            title: "메인 카운트",
                            count: store.counter1,
                            onIncrement: { store.send(.counter1Increment) },
                            onDecrement: { store.send(.counter1Decrement) }
                        )
                    }
                }
                if store.counter1 > 5 {
                    Text("5를 넘었습니다!")
                        .font(.title2)
                        .foregroundStyle(.orange)
                        
                }
            }
            
            // 사용자 온라인 상태에 따른 다른 UI
            if store.isUserOnline {
                UserInfoComponent(
                    name: store.userName,
                    email: store.userEmail,
                    isOnline: store.isUserOnline,
                    onEditTap: { store.send(.editUserTapped) }
                )
            } else {
                Text("사용자가 오프라인 상태입니다.")
                    .foregroundStyle(.gray)
                    .padding()
            }
        }
        .padding()
    }
    
    
}
