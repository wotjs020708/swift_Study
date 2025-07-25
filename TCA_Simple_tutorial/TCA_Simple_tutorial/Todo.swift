//
//  ContentView.swift
//  TCA_Simple_tutorial
//
//  Created by 어재선 on 7/23/25.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct Todo {
    @ObservableState
    struct State: Equatable, Identifiable {
        var description: String
        let id: UUID
        var isComplete: Bool
        
        init(
            description: String = "",
            id: UUID,
            isComplete: Bool = false
        ) {
            self.description = description
            self.id = id
            self.isComplete = isComplete
        }
    }
    
    enum Action: BindableAction, Sendable {
        case binding(BindingAction<State>)
    }
  
    var body: some Reducer<State, Action> {
        BindingReducer()
    }
}

struct TodoView: View {
    @Bindable var store: StoreOf<Todo>
    
    var body: some View {
        HStack {
            Button {
                store.isComplete.toggle()
            } label: {
                Image(systemName: store.isComplete ? "checkmark.square" : "square")
            }
            .buttonStyle(.plain)
            
            TextField("Untitled Todo", text: $store.description)
            }
        .foregroundColor(store.isComplete ? .gray : nil)
    }
}
