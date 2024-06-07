//
//  ContactView.swift
//  My
//
//  Created by IK-LPC-084 on 6/7/24.
//

import ComposableArchitecture
import SwiftUI

struct ContactView: View {
    @Bindable var store: StoreOf<ContactsFeature>
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(store.contacts) { contact in
                    Text(contact.name)
                }
            }
            .navigationTitle("Contacts")
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        store.send(.addButtonTapped)
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
            }
        }
        .sheet(
             item: $store.scope(state: \.addContact, action: \.addContact)
           ) { addContactStore in
             NavigationStack {
               AddContactView(store: addContactStore)
             }
           }
    }
}

#Preview {
    ContactView(
        store: Store(
            initialState: ContactsFeature.State(
                contacts: [
                    Contact(id: UUID(), name: "Blob"),
                    Contact(id: UUID(), name: "Blob Jr"),
                    Contact(id: UUID(), name: "Blob Sr"),
                ]
            ), reducer: {
                ContactsFeature()
            }))
}
