//
//  AppFeature.swift
//  My
//
//  Created by IK-LPC-084 on 6/5/24.
//

import Foundation
import ComposableArchitecture

@Reducer
struct AppFeature {
    struct State: Equatable {
        var tab1 = CounterFeature.State()
        var tab2 = CounterFeature.State()
    }
    
    enum Action {
        case tab1(CounterFeature.Action)
        case tab2(CounterFeature.Action)
    }
    
    var body: some ReducerOf<Self> {
        
        Scope(state: \.tab1, action: \.tab1) {
            CounterFeature()
        }
        
        Scope(state: \.tab2, action: \.tab2) {
            CounterFeature()
        }
        
//        ifCaseLet(_:action:then:fileID:line:)
        
        Reduce { state, action in
            // Core logic of the app feature
            return .none
        }
    }
}
