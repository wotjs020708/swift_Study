//
//  AdvancedMainFeature.swift
//  TCA_Simple_Component
//
//  Created by 어재선 on 7/30/25.
//

import SwiftUI
import ComposableArchitecture


//MARK: - Advanced Pattern3:  메인 Feature (복합 상태 관리)
@Reducer
struct AdvancedFeature {
    @ObservableState
    struct State: Equatable {
        // 여러 개의 독립 적인 카운터들
        var counters: IdentifiedArrayOf<CounterFeature.State> = []
        
        // 동적 Todo 리스트
        var todos: IdentifiedArrayOf<TodoItem.State> = []
        
        // 글로벌 설정
        var isGlobalEnabled: Bool = true
        var theme: Theme = .light
        
        // 통계 정보 (계산된 프로퍼티)
        var totalCountValue: Int {
            counters.reduce(0) { $0 + $1.count }
        }
        
        var completedTodosCount: Int {
            todos.filter(\.isCompleted).count
        }
        
        var highPriorityTodosCount: Int {
            todos.filter { $0.priority == .high }.count
        }
        
        enum Theme: String, CaseIterable {
            case light = "라이트"
            case dark = "다크"
            case auto = "자동"
        }
    }
    
    enum Action: Equatable {
        // 카운터 관련 액션들
        case addCounter
        case removeCounter(id: CounterFeature.State.ID)
        case counter(id: CounterFeature.State.ID, action: CounterFeature.Action)
        
        // Todo 관련 애션들
        case addTodo(String)
        case removeTodo(id: TodoItem.State.ID)
        case todo(id: TodoItem.State.ID, action: TodoItem.Action)
        
        // 글로벌 액션들
        case toggleGlobalEnabled
        case changeTheme(State.Theme)
        case resetAll
        
        // 복합 액션들
        case completeAllTodos
        case resetAllCounters
    }
    
    
    var body: some ReducerOf<Self> {
        Reduce { state , action in
            switch action {
                // 카운터 관리
            case .addCounter:
                let newCounter = CounterFeature.State()
                state.counters.append(newCounter)
                return .none
            case .removeCounter(let id):
                state.counters.remove(id: id)
                return .none
                
                // Todo 관리
            case .addTodo(let title):
                let newTodo = TodoItem.State(title: title)
                state.todos.append(newTodo)
                return .none
            case .removeTodo(let id):
                state.todos.remove(id: id)
                return .none
                
                // 글로벌 설정
            case .toggleGlobalEnabled:
                state.isGlobalEnabled.toggle()
                // 모든 카운터의 활성화 상태도 함께 변경
                for id in state.counters.ids {
                    state.counters[id : id]?.isEnabled = state.isGlobalEnabled
                }
                return .none
            case .changeTheme(let theme):
                state.theme = theme
                return .none
                
            case .resetAll:
                state.counters.removeAll()
                state.todos.removeAll()
                return .none
                
            case .completeAllTodos:
                for id in state.todos.ids {
                    state.todos[id: id]?.isCompleted = true
                }
                return .none
                
            case .resetAllCounters:
                for id in state.counters.ids {
                    state.counters[id: id]?.count = 0
                }
                return .none
                
            case .counter, .todo:
                // 자식 Feature들의 액션은 아래 forEach에서 처리
                return .none
            }
            
        }
        .forEach(\.counters, action: \.counter) {
            CounterFeature()
        }
        .forEach(\.todos, action: \.todo) {
            TodoItem()
        }
    }
}
