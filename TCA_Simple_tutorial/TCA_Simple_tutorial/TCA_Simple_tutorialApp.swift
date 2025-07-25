//
//  TCA_Simple_tutorialApp.swift
//  TCA_Simple_tutorial
//
//  Created by 어재선 on 7/23/25.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCA_Simple_tutorialApp: App {
    static let store = Store(initialState: Todos.State()) {
        Todos()
            ._printChanges()
    }
    var body: some Scene {
       
        WindowGroup {
            AppView(store: Self.store, )
        }
    }
}
