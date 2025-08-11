//
//  ModalFeature.swift
//  TCAModal
//
//  Created by 어재선 on 8/7/25.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct ModalFeature {
    @ObservableState
    struct State: Equatable {
        var newText = " "
    }
    
    enum Action {
        case textChanged(String)
        case saveButtonTapped
        case cancelButtonTapped
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case let .textChanged(text):
                state .newText = text
                return .none
            case .saveButtonTapped, .cancelButtonTapped:
                return .none
            }
        }
    }
}
