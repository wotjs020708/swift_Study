//
//  CounterFeature.swift
//  TCA_Simple_Component
//
//  Created by 어재선 on 7/30/25.
//

import SwiftUI
import ComposableArchitecture

// MARK: - Advanced Pattern 1: 중첩된 TCA Feature 컴포넌트

// 독립적인 TCA Feature를 가진 컴포넌트
@Reducer
struct CounterFeature {
    @ObservableState
    struct State: Equatable, Identifiable {
        let id = UUID()
        var count: Int = 0
        var isEnabled: Bool = true
        
        var displayText: String {
            isEnabled ? "\(count)" : "비활성화"
        }
    }
    
    enum Action: Equatable {
        case increment
        case decrement
        case toggleEnabled
        case rest
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .increment:
                guard state.isEnabled else { return .none }
                state.count += 1
                return .none
            
            case .decrement:
                guard state.isEnabled else { return .none }
                return .none
                
            case .toggleEnabled:
                state.isEnabled.toggle()
                return .none
            case .rest:
                state.count = 0
                return .none
            }
        }
    }
}
