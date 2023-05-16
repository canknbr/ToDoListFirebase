//
//  ProfileViewViewModel.swift
//  todoListiA
//
//  Created by Can Kanbur on 15.05.2023.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation
class ProfileViewViewModel: ObservableObject {
    @Published var user: User? = nil

    func fetchUser() {
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .getDocument { [weak self] snap, error in
                guard let data = snap?.data(), error == nil else {
                    return
                }

                DispatchQueue.main.async {
                    self?.user = User(id: data["id"] as? String ?? "",
                                      name: data["name"] as? String ?? "",
                                      email: data["email"] as? String ?? ""
                                      , joined: data["joined"] as? TimeInterval ?? 0)
                }
            }
    }

    func logOut() {
        do{
            try Auth.auth().signOut()
        }catch{
            print(error)
        }
    }
}
