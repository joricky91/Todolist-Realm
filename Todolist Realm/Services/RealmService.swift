//
//  RealmService.swift
//  Todolist Realm
//
//  Created by Jonathan Ricky Sandjaja on 24/02/23.
//

import Foundation
import RealmSwift

class RealmService {
    
    func addTask(task: String, realm: Realm?) {
        guard let realm = realm else { return }
        
        do {
            try realm.write {
                let newTask = Todo(value: ["task": task])
                realm.add(newTask)
            }
        } catch {
            print(error)
        }
    }
    
    func fetchTask(realm: Realm?, completion: @escaping(Results<Todo>) -> Void) {
        guard let realm = realm else { return }
        
        let todoData = realm.objects(Todo.self)
        completion(todoData)
    }
    
    func delete(realm: Realm?, id: ObjectId) {
        guard let realm = realm else { return }
        
        do {
            let taskToDelete = realm.objects(Todo.self).filter("id == %@", id)
            
            try realm.write {
                realm.delete(taskToDelete)
            }
            
        } catch {
            
        }
    }
    
}
