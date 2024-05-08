//
//  AccountView.swift
//  Foodie
//
//  Created by Nasir on 04/11/2023.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel = AccountViewModel()
    
    enum FormTextField {
        case firstName, lastName, email
    }
    
    @FocusState var focusedTextField: FormTextField?
    
    var body: some View {
        NavigationView {
            Form {
                Section("Personal Info") {
                    TextField("First Name", text: $viewModel.user.firstName)
                        .focused($focusedTextField, equals: .firstName)
                        .onSubmit { focusedTextField = .lastName }
                        .submitLabel(.next)
                    TextField("Last Name", text: $viewModel.user.lastName)
                        .focused($focusedTextField, equals: .lastName)
                        .onSubmit { focusedTextField = .email }
                        .submitLabel(.next)
                    TextField("Email", text: $viewModel.user.email)
                        .focused($focusedTextField, equals: .email)
                        .onSubmit { focusedTextField = nil }
                        .submitLabel(.continue)
                    DatePicker("Date of Birth", selection: $viewModel.user.birthday, displayedComponents: .date)
                    Button(action: {
                        viewModel.saveChanges()
                    }, label: {
                        Text("Save Changes")
                    })
                }
                
                Section("Extras") {
                    Toggle(isOn: $viewModel.user.extraNapkins, label: {
                        Text("Extra Napkins")
                    })
                    Toggle(isOn: $viewModel.user.extraRefill, label: {
                        Text("Extra Refill")
                    })

                }
                .tint(.brandPrimary)
            }
            .navigationTitle("Account")
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    Button("Dismiss") {
                        focusedTextField = nil
                    }
                }
            }
        }
        .onAppear {
            viewModel.retrieveUser()
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    AccountView()
}
