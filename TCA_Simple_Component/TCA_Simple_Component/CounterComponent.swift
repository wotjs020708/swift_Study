//
//  CounterComponent.swift
//  TCA_Simple_Component
//
//  Created by 어재선 on 7/29/25.
//

import SwiftUI

struct CounterComponent: View {
    let title: String
    let count: Int
    let onIncrement: () -> Void
    let onDecrement: () -> Void
    
    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
            
            Text("\(count)")
                .font(.title)
                .foregroundStyle(.blue)
            
            HStack {
                Button("-") { onDecrement() }
                    .padding()
                    .background()
                    .foregroundStyle(.white)
                    .cornerRadius(8)
                
                Button("+") { onIncrement() }
                    .padding()
                    .background(.green)
                    .foregroundStyle(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
        .border(.gray)
    }
}

