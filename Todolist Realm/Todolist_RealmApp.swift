//
//  Todolist_RealmApp.swift
//  Todolist Realm
//
//  Created by Jonathan Ricky Sandjaja on 24/02/23.
//

import SwiftUI

@main
struct Todolist_RealmApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(TodoViewModel())
        }
    }
}
