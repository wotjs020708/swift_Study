//
//  TCA_Simple_ComponentApp.swift
//  TCA_Simple_Component
//
//  Created by 어재선 on 7/28/25.
//

import SwiftUI
import ComposableArchitecture
// MAKR: - 단계 4: 앱 진입점

@main
struct TCA_Simple_ComponentApp: App {
    var body: some Scene {
        WindowGroup {
            AdvancedView(
                store: Store(
                    initialState: AdvancedFeature.State(
                        counters: [
                            CounterFeature.State(count: 5),
                            CounterFeature.State(count: 10),
                                  ],
                        todos: [
                            TodoItem.State(title: "TCA 공부하기", priority: .high),
                            TodoItem.State(title: "SwiftUI 연습하기", priority: .normal)
                        ]
                    ),
                    reducer: { AdvancedFeature() }
                )
            )
        }
    }
}
