//
//  CounterFeature.swift
//  My
//
//  Created by IK-LPC-084 on 6/4/24.
//

import ComposableArchitecture


@Reducer
struct CounterFeature {
    @ObservableState
    struct State {
        var count = 0
    }
    
    enum Action {
        case decrementButtonTapped
        case incrementButtonTapped
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .decrementButtonTapped:
                print("")
                return .none
            case .incrementButtonTapped:
                print("")
                return .none
            }
        }
    }
}
