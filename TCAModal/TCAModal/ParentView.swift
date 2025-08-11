//
//  ParentView.swift
//  TCAModal
//
//  Created by 어재선 on 8/7/25.
//

import SwiftUI
import ComposableArchitecture

struct ParentView: View {
    let store: StoreOf<ParentFeature>
    
    var body: some View {
        VStack(spacing: 30) {
            Text(store.displayText)
                .font(.largeTitle)
                .padding()
                .background(Color.blue.opacity(0.1))
                .cornerRadius(10)
            
            Button("텍스트 변경하기") {
                store.send(.showModalButtonTapped)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .sheet(
            store: store.scope(state: \.$modal, action: \.modal)
        ) {
            ModalView(store: $0)
        }
    }
}

#Preview {
    ParentView(store: Store(initialState: ParentFeature.State(), reducer: { ParentFeature() }))
}
