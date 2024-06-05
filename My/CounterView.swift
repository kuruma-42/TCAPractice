//
//  CounterView.swift
//  My
//
//  Created by IK-LPC-084 on 6/4/24.
//

import ComposableArchitecture
import Foundation
import SwiftUI

struct CounterView: View {
    let store: StoreOf<CounterFeature>
    
    var body: some View {
        VStack {
            Text("\(store.count)")
                .font(.largeTitle)
                .padding()
                .background(Color.black.opacity(0.1))
                .cornerRadius(10)
            
            HStack {
                Button(action: {
                    store.send(.decrementButtonTapped)
                }, label: {
                    Text("-")
                        .font(.largeTitle)
                        .padding()
                        .background(Color.black.opacity(0.1))
                        .cornerRadius(10)
                })
                
                Button("+") {
                    store.send(.incrementButtonTapped)
                }
                .font(.largeTitle)
                .padding()
                .background(Color.black.opacity(0.1))
                .cornerRadius(10)
            }
            
            
        }
    }
    
}


#Preview {
    CounterView(
        store: Store(initialState: CounterFeature.State(),
                     reducer: {CounterFeature()})
    )
}