//
//  RegisterViewViewModel.swift
//  todoListiA
//
//  Created by Can Kanbur on 15.05.2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewViewModel : ObservableObject {
    
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(){
        
    }
    
    
    func register(){
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) {[weak self ] authData, error in
            guard let userId = authData?.user.uid else {
                return
            }
            self?.inserUserRecord(id: userId)
        }
        
    }
    
    private func inserUserRecord(id:String){
        
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
        
    }
    
    private func validate()-> Bool {
        
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty &&
                !email.trimmingCharacters(in: .whitespaces).isEmpty &&
                !password.trimmingCharacters(in: .whitespaces).isEmpty else{
                
            errorMessage = ""
            return false
            
        }
        guard email.contains("@") && email.contains(".") else {
            errorMessage = ""
            return false
        }
        
        guard password.count >= 6 else {
            errorMessage = ""
            return false
        }
        return true
        
    }
    
}
