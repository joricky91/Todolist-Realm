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
        guard let realm = realm else { return }
        
        let todoData = realm.objects(Todo.self)
        todos = []
        todoData.forEach { todo in
            todos.append(todo)
        }
    }
    
    func deleteTask(id: ObjectId) {
        guard let realm = realm else { return }
        
        do {
            let taskToDelete = realm.objects(Todo.self).filter(NSPredicate(format: "id == %@", id))
            guard !taskToDelete.isEmpty else { return }
            
            try realm.write {
                realm.delete(taskToDelete)
                fetchTask()
            }
            
        } catch {
            print("Error deleting, error: \(error)")
        }
    }
}
