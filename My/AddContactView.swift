//
//  AddContactView.swift
//  My
//
//  Created by IK-LPC-084 on 6/7/24.
//

import ComposableArchitecture
import SwiftUI

struct AddContactView: View {
    // store는 observable 객체이기 때문에 bindable로 넘겨준다.
    @Bindable var store: StoreOf<AddContactFeature>
    
    // @State에서 온 것만
    // @Binding
    var body: some View {
        Form {
            TextField("Name", text: $store.contact.name.sending(\.setName))
            Button("Save") {
                store.send(.saveButtonTapped)
            }
        }
        .toolbar {
            ToolbarItem {
                Button("Cancel") {
                    store.send(.cancelButtonTapped)
                }
            }
        }
    }
    
    
    
}

#Preview {
  NavigationStack {
    AddContactView(
      store: Store(
        initialState: AddContactFeature.State(
          contact: Contact(
            id: UUID(),
            name: "Blob"
          )
        )
      ) {
        AddContactFeature()
      }
    )
  }
}
