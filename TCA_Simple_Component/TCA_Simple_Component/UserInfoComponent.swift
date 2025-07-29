//
//  UserInfoComponent.swift
//  TCA_Simple_Component
//
//  Created by 어재선 on 7/29/25.
//

import SwiftUI

struct UserInfoComponent: View {
    let name: String
    let email: String
    let isOnline: Bool
    let onEditTap: () -> Void
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(name)
                    .font(.headline)
                Text(email)
                    .font(.caption)
                    .foregroundStyle(.gray)
                
                HStack {
                    Circle()
                        .fill(isOnline ? .green : . gray)
                        .frame(width: 8, height: 8)
                    Text(isOnline ? "온라인" : "오프라인")
                        .font(.caption)
                }
            }
            Spacer()
            
            Button("편집") { onEditTap() }
                .padding(.horizontal)
                .foregroundColor(.blue)
                .background(.blue)
                .foregroundStyle(.white)
                .cornerRadius(8)
        }
        .padding()
        .background(.gray.opacity(0.1))
        .cornerRadius(8)
    }
}

