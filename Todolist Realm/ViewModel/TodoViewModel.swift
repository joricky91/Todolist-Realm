//
//  TodoViewModel.swift
//  Todolist Realm
//
//  Created by Jonathan Ricky Sandjaja on 24/02/23.
//

import Foundation
import RealmSwift

class TodoViewModel: ObservableObject {
    private var realm = try? Realm()
    @Published var todos: [Todo] = []
    
    func addNewTask(task: String) {
        RealmService.shared.addTask(task: task, realm: realm)
    }
    
    func fetchTask() {
        RealmService.shared.fetchTask(realm: realm) { [weak self] result in
            self?.todos = []
            
            result.forEach { todo in
                self?.todos.append(todo)
            }
        }
    }
    
    func deleteTask(id: ObjectId) {
        RealmService.shared.delete(realm: realm, id: id)
    }
}
