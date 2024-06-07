//
//  AppView.swift
//  My
//
//  Created by IK-LPC-084 on 6/5/24.
//

import ComposableArchitecture
import Foundation
import SwiftUI

struct AppView: View {
// 원래는 쓸 Reducer를 직접 선언해줬는데
// 이번에는 AppFeature에 있는 Scope를 통해 child state와 chiled Action을 주입해준댜.
//    let store1: StoreOf<CounterFeature>
//    let store2: StoreOf<CounterFeature>
    
    let store: StoreOf<AppFeature>
    
    var body: some View {
        TabView {
            CounterView(store: store.scope(state: \.tab1, action: \.tab1))
                .tabItem {
                    Text("Counter 1")
                }
            
            CounterView(store: store.scope(state: \.tab2, action: \.tab2))
                .tabItem {
                    Text("Counter 2")
                }
        }
    }
}

#Preview {
    AppView(
        store: Store(initialState: AppFeature.State(), reducer: {
            AppFeature()
        })
    )
}
