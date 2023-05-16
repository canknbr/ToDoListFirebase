//
//  MainViewViewModel.swift
//  todoListiA
//
//  Created by Can Kanbur on 15.05.2023.
//

import Foundation
import FirebaseAuth
class MainViewViewModel: ObservableObject {
    @Published var currentUserId: String = ""
   private var handler : AuthStateDidChangeListenerHandle?
    init() {
        self.handler = Auth.auth().addStateDidChangeListener {[weak self] _ , user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }

    public var isSignedIn : Bool {
        return Auth.auth().currentUser != nil
    }
    
}
