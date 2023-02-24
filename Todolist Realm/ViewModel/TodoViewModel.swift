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
    
    func addNewTask(task: String) {
        guard let realm = realm else { return }
        
        do {
            try realm.write {
                let newTask = Todo(value: ["task": task])
                realm.add(newTask)
                print("Task added")
            }
        } catch {
            print(error)
        }
    }
}