//
//  LoadingComponent.swift
//  TCA_Simple_Component
//
//  Created by 어재선 on 7/29/25.
//

import SwiftUI

struct LoadingComponent: View {
    let isLoading: Bool
    let message: String
    let onLoadTap: () -> Void
    
    var body: some View {
        VStack {
            if isLoading {
                ProgressView()
                Text("로딩 중...")
                    .font(.caption)
            } else {
                Text(message)
                    .font(.body)
                
                Button("데이터 로드") { onLoadTap() }
                    .padding()
                    .background(.orange)
                    .foregroundStyle(.white)
                    .cornerRadius(8)
            }
        }
        .frame(height: 80)
        .padding()
        .border(.orange)
    }
}
