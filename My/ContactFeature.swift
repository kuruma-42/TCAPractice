//
//  ContactFeature.swift
//  My
//
//  Created by IK-LPC-084 on 6/7/24.
//

import ComposableArchitecture
import Foundation

struct Contact: Equatable, Identifiable {
    let id: UUID
    var name: String
}

@Reducer
struct ContactsFeature {
    @ObservableState
    struct State: Equatable {
//        @Presents var addContact: AddContactFeature.State?
//        @Presents var alert: AlertState<Action.Alert>?
        @Presents var destination: Destination.State?
        var contacts: IdentifiedArrayOf<Contact> = []
        var path = StackState<ContactDetailFeature.State>()
    }
    enum Action {
        case addButtonTapped
//        case addContact(PresentationAction<AddContactFeature.Action>)
//        case alert(PresentationAction<Alert>)
        case destination(PresentationAction<Destination.Action>)
        case path(StackAction<ContactDetailFeature.State, ContactDetailFeature.Action>)
        case deleteButtonTapped(id: Contact.ID)
        enum Alert: Equatable {
            case confirmDeletion(id: Contact.ID)
        }
    }
    @Dependency(\.uuid) var uuid
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .addButtonTapped:
                state.destination = .addContact(
                     AddContactFeature.State(
                       contact: Contact(id: UUID(), name: "")
                     )
                   )
                return .none
                
            case let .destination(.presented(.addContact(.delegate(.saveContact(contact))))):
                state.contacts.append(contact)
                return .none
                
            case let .destination(.presented(.alert(.confirmDeletion(id: id)))):
                state.contacts.remove(id: id)
                return .none
                
            case .destination:
                return .none
                
            case let .deleteButtonTapped(id: id):
                state.destination = .alert(
                    AlertState {
                        TextState("Are you sure?")
                    } actions: {
                        ButtonState(role: .destructive, action: .confirmDeletion(id: id)) {
                            TextState("Delete")
                        }
                    }
                )
                return .none
                
            case .path(_):
                return .none
            }
        }
        .ifLet(\.$destination, action: \.destination) {
            
        }
        .forEach(\.path, action: \.path) {
            ContactDetailFeature()
        }
    }
}

extension ContactsFeature {
  @Reducer(state: .equatable)
  enum Destination {
    case addContact(AddContactFeature)
    case alert(AlertState<ContactsFeature.Action.Alert>)
  }
}
