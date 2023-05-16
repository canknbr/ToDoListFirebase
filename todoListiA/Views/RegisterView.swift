//
//  RegisterView.swift
//  todoListiA
//
//  Created by Can Kanbur on 15.05.2023.
//

import SwiftUI

struct RegisterView: View {
  @StateObject var viewModel = RegisterViewViewModel()
    var body: some View {
        
        VStack {
            HeaderView(angleValue: -15, headerColor: .yellow, title: "Register", subTitle: "Start organizing todos")
            Form {
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                TLButton(title: "Create Account",bgColor: .pink,action: {
                    viewModel.register()
                    
                }).padding()
            }.offset(y:-50)
            
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
