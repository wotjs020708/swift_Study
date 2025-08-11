//
//  ParentFeature.swift
//  TCAModal
//
//  Created by 어재선 on 8/7/25.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct ParentFeature {
    @ObservableState
    struct State: Equatable {
        var displayText = "안녕하세요!"
        @Presents var modal: ModalFeature.State?
    }
    
    enum Action {
        case showModalButtonTapped
        case modal(PresentationAction<ModalFeature.Action>)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .showModalButtonTapped:
                state.modal = ModalFeature.State()
                return .none
                
            case .modal(.presented(.saveButtonTapped)):
                if let newText = state.modal?.newText, !newText.isEmpty {
                    state.displayText = newText
                }
                state.modal = nil
                return .none
                
            case .modal(.presented(.cancelButtonTapped)):
                state.modal = nil
                return .none
                
            case .modal:
                return .none
            }
        }
        .ifLet(\.$modal, action: \.modal) {
            ModalFeature()
        }
    }
}
