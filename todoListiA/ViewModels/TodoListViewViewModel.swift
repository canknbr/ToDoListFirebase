//
//  TodoListViewViewModel.swift
//  todoListiA
//
//  Created by Can Kanbur on 15.05.2023.
//

import Foundation
import FirebaseFirestore
class TodoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    private let userId : String
    init(userId : String) {
        self.userId = userId
    }
    
    func delete(itemId : String ){
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(itemId)
            .delete()
    }
}
