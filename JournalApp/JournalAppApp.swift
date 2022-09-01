//
//  JournalAppApp.swift
//  JournalApp
//
//  Created by Kathrine Heinzel on 20.12.21.
//

import SwiftUI

@main
struct JournalAppApp: App {
    @StateObject var entryController = EntryController();
    @StateObject var entryUser = User(name: "visitor");
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(entryController)
                .environmentObject(entryUser)
        }
    }
}
