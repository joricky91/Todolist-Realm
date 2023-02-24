//
//  ContentView.swift
//  Todolist Realm
//
//  Created by Jonathan Ricky Sandjaja on 24/02/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var todoVM: TodoViewModel
    
    var body: some View {
        VStack {
            List {
                ForEach(todoVM.todos, id: \.id) { todo in
                    Text(todo.task)
                }
            }
            
            Button {
                todoVM.addNewTask(task: "Tes 3")
                todoVM.fetchTask()
            } label: {
                Text("Add Task")
            }
        }
        .padding()
        .onAppear {
            todoVM.fetchTask()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(TodoViewModel())
    }
}
