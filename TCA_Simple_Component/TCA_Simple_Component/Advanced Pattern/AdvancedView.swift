//
//  AdvancedView.swift
//  TCA_Simple_Component
//
//  Created by 어재선 on 7/30/25.
//

import SwiftUI
import ComposableArchitecture

struct AdvancedView: View {
    let store: StoreOf<AdvancedFeature>
    @State private var newTodoText = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing:20) {
                    // 해더: 통계 정보
                    statisticsSection
                    // 글로벌 컨트롤
                    globalControlsSection
                    // 동적 카운터 섹션
                    countersSection
                    // Todo 섹션
                    todosSection
                    Spacer(minLength: 50)
                }
                .padding()
            }
            .navigationTitle("Advanced TCA")
            .navigationBarTitleDisplayMode(.large)
        }
    }
    private var statisticsSection: some View {
        VStack(spacing: 10) {
                    Text("📊 통계")
                        .font(.title2)
                        .bold()
                    
                    HStack(spacing: 20) {
                        StatCard(
                            title: "총 카운터 값",
                            value: "\(store.counters.count)",
                            color: .blue
                        )
                        
                        StatCard(
                            title: "완료된 할 일",
                            value: "\(store.completedTodosCount)/\(store.todos.count)",
                            color: .green
                        )
                        
                        StatCard(
                            title: "높은 우선순위",
                            value: "\(store.highPriorityTodosCount)",
                            color: .red
                        )
                    }
                }
                .padding()
                .background(.gray.opacity(0.1))
                .cornerRadius(12)
            }
            
            private var globalControlsSection: some View {
                VStack(spacing: 15) {
                    Text("🎛️ 글로벌 설정")
                        .font(.title2)
                        .bold()
                    
                    HStack {
                        Toggle("전체 활성화", isOn: .init(
                            get: { store.isGlobalEnabled },
                            set: { _ in store.send(.toggleGlobalEnabled) }
                        ))
                        
                        Spacer()
                        
                        Menu("테마: \(store.theme.rawValue)") {
                            ForEach(AdvancedFeature.State.Theme.allCases, id: \.self) { theme in
                                Button(theme.rawValue) {
                                    store.send(.changeTheme(theme))
                                }
                            }
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    
                    HStack(spacing: 10) {
                        Button("모든 할 일 완료") { store.send(.completeAllTodos) }
                            .buttonStyle(.bordered)
                        
                        Button("카운터 리셋") { store.send(.resetAllCounters) }
                            .buttonStyle(.bordered)
                        
                        Button("전체 리셋") { store.send(.resetAll) }
                            .buttonStyle(.borderedProminent)
                            .foregroundColor(.red)
                    }
                }
                .padding()
                .background(.blue.opacity(0.1))
                .cornerRadius(12)
            }
            
            private var countersSection: some View {
                VStack(spacing: 15) {
                    HStack {
                        Text("🔢 동적 카운터들")
                            .font(.title2)
                            .bold()
                        
                        Spacer()
                        
                        Button("카운터 추가") {
                            store.send(.addCounter)
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    
                    if store.counters.isEmpty {
                        Text("카운터를 추가해보세요!")
                            .foregroundColor(.gray)
                            .padding()
                    } else {
                        LazyVGrid(columns: [
                            GridItem(.flexible()),
                            GridItem(.flexible())
                        ], spacing: 10) {
                            ForEachStore(
                                store.scope(state: \.counters, action: \.counter)
                            ) { counterStore in
                                CounterFeatureView(
                                    store: counterStore,
                                    title: "카운터 #\(counterStore.id.uuidString.prefix(4))"
                                )
                                .contextMenu {
                                    Button("삭제", role: .destructive) {
                                        store.send(.removeCounter(id: counterStore.id))
                                    }
                                }
                            }
                        }
                    }
                }
                .padding()
                .background(.green.opacity(0.1))
                .cornerRadius(12)
            }
            
    private var todosSection: some View {
        VStack(spacing: 15) {
            HStack {
                Text("✅ 할 일 목록")
                    .font(.title2)
                    .bold()
                
                Spacer()
            }
            
            // 새 할 일 추가
            HStack {
                TextField("새 할 일 입력", text: $newTodoText)
                    .textFieldStyle(.roundedBorder)
                
                Button("추가") {
                    guard !newTodoText.isEmpty else { return }
                    store.send(.addTodo(newTodoText))
                    newTodoText = ""
                }
                .buttonStyle(.borderedProminent)
                .disabled(newTodoText.isEmpty)
            }
            
            if store.todos.isEmpty {
                Text("할 일을 추가해보세요!")
                    .foregroundColor(.gray)
                    .padding()
            } else {
                LazyVStack(spacing: 8) {
                    ForEachStore(
                        store.scope(state: \.todos, action: \.todo)
                    ) { todoStore in
                        TodoItmeView(store: todoStore)
                            .swipeActions(edge: .trailing) {
                                Button("삭제", role: .destructive) {
                                    store.send(.removeTodo(id: todoStore.id))
                                }
                            }
                    }
                }
            }
        }
        .padding()
        .background(.orange.opacity(0.1))
        .cornerRadius(12)
    
    }
}

// MARK: - 헬퍼 뷰들

struct StatCard: View {
    let title: String
    let value: String
    let color: Color
    
    var body: some View {
        VStack {
            Text(value)
                .font(.title)
                .bold()
                .foregroundColor(color)
            
            Text(title)
                .font(.caption)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.white)
        .cornerRadius(8)
        .shadow(radius: 2)
    }
}
