//
//  TCAModalApp.swift
//  TCAModal
//
//  Created by 어재선 on 8/7/25.
//

import SwiftUI
import ComposableArchitecture
@main
struct TCAModalApp: App {
    var body: some Scene {
        WindowGroup {
            ParentView(
                store: Store(initialState: ParentFeature.State()){
                     ParentFeature()
                }
            )
        }
    }
}
