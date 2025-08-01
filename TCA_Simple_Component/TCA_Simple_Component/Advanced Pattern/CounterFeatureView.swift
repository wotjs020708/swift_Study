//
//  CounterFeatureView.swift
//  TCA_Simple_Component
//
//  Created by 어재선 on 7/30/25.
//

import SwiftUI
import ComposableArchitecture


// TCA Feature를 사용하는 컴퍼넌트 뷰
struct CounterFeatureView: View {
    let store: StoreOf<CounterFeature>
    let title: String
    
    var body: some View {
        VStack(spacing: 10) {
            Text(title)
                .font(.headline)
            
            Text(store.displayText)
                .font(.largeTitle)
                .foregroundStyle(store.isEnabled ? .blue : .gray)
            
            HStack(spacing: 15) {
                Button("-") { store.send(.decrement) }
                    .disabled(!store.isEnabled)
                
                Button("+") { store.send(.increment) }
                    .disabled(!store.isEnabled)
                Button("토글") { store.send(.toggleEnabled) }
                    .foregroundStyle(.orange)
                Button("리셋") { store.send(.rest) }
                    .foregroundStyle(.red)
            }
            .buttonStyle(.bordered)
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(store.isEnabled ? .blue : .gray, lineWidth: 2)
        )
    }
}
