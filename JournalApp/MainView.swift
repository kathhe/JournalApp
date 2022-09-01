//
//  MainView.swift
//  JournalApp
//
//  Created by Kathrine Heinzel on 10.01.22.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var entryController: EntryController
    @EnvironmentObject var entryUser: User
    @State private var selection = 1
    
    init() {

    }
    
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Journal", systemImage: "book")
                }
                
            
            StatView()
                .tabItem {
                    Label("Stats", systemImage: "heart.text.square.fill")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "pencil.slash")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(User(name: "Visitor"))
    }
}
