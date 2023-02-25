//
//  ContentView.swift
//  Todolist Realm
//
//  Created by Jonathan Ricky Sandjaja on 24/02/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var todoVM: TodoViewModel
    @State var isPresented = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(todoVM.todos, id: \.id) { todo in
                    if !todo.isInvalidated {
                        Text(todo.task)
                    }
                }
                .onDelete { indexSet in
                    indexSet.forEach { index in
                        let taskTodelete = todoVM.todos[index]
                        todoVM.deleteTask(id: taskTodelete.id)
                        todoVM.fetchTask()
                    }
                }
            }
            .navigationTitle("Todo")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isPresented = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            })
            .onAppear {
                todoVM.fetchTask()
            }
        }
        .sheet(isPresented: $isPresented, content: {
            AddTaskView()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(TodoViewModel())
    }
}
