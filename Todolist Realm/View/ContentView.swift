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
            Button {
                todoVM.addNewTask(task: "Tes")
            } label: {
                Text("Add Task")
            }

        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(TodoViewModel())
    }
}
