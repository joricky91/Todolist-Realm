//
//  AddTaskView.swift
//  Todolist Realm
//
//  Created by Jonathan Ricky Sandjaja on 25/02/23.
//

import SwiftUI

struct AddTaskView: View {
    @State var task = ""
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var todoVM: TodoViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter task...", text: $task)
                    .padding(.bottom)
                
                Button {
                    todoVM.addNewTask(task: task)
                    todoVM.fetchTask()
                    dismiss()
                } label: {
                    Text("Add Task")
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width / 1.2, height: UIScreen.main.bounds.width / 8)
                        .background(.blue)
                        .cornerRadius(8)
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Add New Task")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .foregroundColor(.red)
                    }

                }
            }
        }
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
            .environmentObject(TodoViewModel())
    }
}
