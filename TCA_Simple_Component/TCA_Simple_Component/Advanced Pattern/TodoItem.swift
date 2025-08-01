//
//  TodoItem.swift
//  TCA_Simple_Component
//
//  Created by 어재선 on 7/30/25.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct TodoItem {
    @ObservableState
    struct State: Equatable, Identifiable {
        let id = UUID()
        var title: String
        var isCompleted: Bool = false
        var priority: Priority = .normal
        
        enum Priority: String, CaseIterable {
            case low = "낮음"
            case normal = "보통"
            case high = "높음"
            
            var color: Color {
                switch self {
                case .low: return .green
                case .normal: return .blue
                case .high: return .red
                }
            }
        }
    }
    enum Action: Equatable {
        case toggleCompleted
        case changePriority(State.Priority)
        case updateTitle(String)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .toggleCompleted:
                state.isCompleted.toggle()
                return .none
                
            case .changePriority(let priority):
                state.priority = priority
                return .none
                
            case .updateTitle(let title):
                state.title = title
                return .none
                
            }
        }
    }
}

