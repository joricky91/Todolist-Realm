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
            VStack {
                List {
                    ForEach(todoVM.todos, id: \.id) { todo in
                        Text(todo.task)
                    }
                }
            }
//            .padding()
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
