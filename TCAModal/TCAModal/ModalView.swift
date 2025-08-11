//
//  ModalView.swift
//  TCAModal
//
//  Created by 어재선 on 8/7/25.
//

import SwiftUI
import ComposableArchitecture

struct ModalView: View {
    @Bindable var store: StoreOf<ModalFeature>
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("새로운 텍스트를 입력하세요")
                    .font(.headline)
                
                TextField("텍스트 입력", text: $store.newText.sending(\.textChanged))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                Spacer()
            }
            .padding()
            .navigationTitle("텍스트 변경")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("취소") {
                        store.send(.cancelButtonTapped)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("저장") {
                        store.send(.saveButtonTapped)
                    }
                    .disabled(store.newText.isEmpty)
                }
            }
        }
    }
}

#Preview {
    ModalView(store: Store(initialState: ModalFeature.State(), reducer: {
        ModalFeature()
    }))
}
