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
    private var realmService = RealmService()
    @Published var todos: [Todo] = []
    
    func addNewTask(task: String) {
        realmService.addTask(task: task, realm: realm)
    }
    
    func fetchTask() {
        realmService.fetchTask(realm: realm) { [weak self] result in
            self?.todos = []
            result.forEach { todo in
                self?.todos.append(todo)
            }
        }
    }
}
