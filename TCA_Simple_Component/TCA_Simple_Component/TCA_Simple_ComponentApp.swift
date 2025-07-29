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
            MainView(
                store: Store(
                    initialState: MainFeature.State(),
                    reducer: { MainFeature() }
                )
            )
        }
    }
}
