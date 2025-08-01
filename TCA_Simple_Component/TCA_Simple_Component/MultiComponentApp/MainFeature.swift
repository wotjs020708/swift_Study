//
//  MainFeature.swift
//  TCA_Simple_Component
//
//  Created by 어재선 on 7/29/25.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct MainFeature {
    @ObservableState
    struct State : Equatable {
        // 첫 번째 카운터 상태
        var counter1: Int = 0
        var counter2: Int = 0
        
        // 사용자 정보 상태
        var userName: String = "김철수"
        var userEmail: String = "kim@example.com"
        var isUserOnline: Bool = true
        
        // 로딩 상태
        var isLoading: Bool = false
        var loadMessage: String = "데이터를 로드해보세요."
        
        // 추가 상태들
        
        var totalCount: Int {
            counter1 + counter2
        }
    }
    
    enum Action: Equatable {
        // 첫 번째 카운터 액션들
        case counter1Increment
        case counter1Decrement
        
        // 두 번째 카운터 액션들
        case counter2Increment
        case counter2Decrement
        
        // 사용자 정보 액션들
        case editUserTapped
        case toggleUserOnlineStatus
        
        // 로딩 액션들
        case loadDataTapped
        case dataLoadComplete
        
        // 전체 리셋 액션
        case resetAll

    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
                // 첫 번째 카운터 액션 처리
            case .counter1Increment:
                state.counter1 += 1
                return .none
            
            case .counter1Decrement:
                state.counter1 -= 1
                return .none
            
                // 두 번째 카운터 액션 처리
            case .counter2Increment:
                state.counter2 += 1
                return .none
            
            case .counter2Decrement:
                state.counter2 -= 1
                return .none
                
                // 로딩 액션 처리
            case .loadDataTapped:
                state.isLoading = true
                return .run { send in
                    //2초 후 로딩 완료
                    try await Task.sleep(for: .seconds(2))
                    await send(.dataLoadComplete)
                }
            
            case .dataLoadComplete:
                state.isLoading = false
                state.loadMessage = "데이터 로드 완료!"
                return .none
            
                // 전체 리셋
            case .resetAll:
                state = State() // 초기 상태로 리셋
                return .none
            case .editUserTapped:
                // 편집 로직(여기서는 이메일만 변경)
                state.userEmail = "test@test.com"
                return .none
            case .toggleUserOnlineStatus:
                state.isUserOnline.toggle()
                return .none
            }
        }
        
    }
    
}
