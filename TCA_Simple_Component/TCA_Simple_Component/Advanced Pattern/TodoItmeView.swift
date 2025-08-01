//
//  TodoItmeView.swift
//  TCA_Simple_Component
//
//  Created by 어재선 on 7/30/25.
//

import SwiftUI
import ComposableArchitecture

struct TodoItmeView: View {
    let store: StoreOf<TodoItem>
    
    var body: some View {
        HStack {
            Button(action: { store.send(.toggleCompleted) }){
                Image(systemName: store.isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundStyle(store.isCompleted ? .green : .gray)
            }
            
            VStack(alignment: .leading) {
                TextField("할 일", text: .init(
                    get: {store.title},
                    set: {store.send(.updateTitle($0)) }
                ))
                .strikethrough(store.isCompleted)
                .opacity(store.isCompleted ? 0.6 : 1.0)
                
                Text(store.priority.rawValue)
                    .font(.caption)
                    .foregroundStyle(store.priority.color)
            }
            
            Spacer()
            
            Menu("우선순위") {
                ForEach(TodoItem.State.Priority.allCases, id: \.self) { priority in
                    Button(priority.rawValue) {
                        store.send(.changePriority(priority))
                    }
                }
            }
            .buttonStyle(.bordered)
            
        }
        .padding()
        .background(store.isCompleted ? .gray.opacity(0.1) : .clear)
        .cornerRadius(8)
        
    }
}
