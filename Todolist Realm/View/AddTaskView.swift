//
//  AddTaskView.swift
//  Todolist Realm
//
//  Created by Jonathan Ricky Sandjaja on 25/02/23.
//

import SwiftUI

struct AddTaskView: View {
    @State var task = ""
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                TextField("Enter task...", text: $task)
                    .padding(.bottom)
                
                Button {
                    
                } label: {
                    Text("Click")
                        .foregroundColor(.white)
                        .frame(width: geo.size.width, height: geo.size.width / 8)
                        .background(.blue)
                        .cornerRadius(8)
                }
            }
        }
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
    }
}
