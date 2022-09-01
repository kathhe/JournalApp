//
//  User.swift
//  JournalApp
//
//  Created by Kathrine Heinzel on 16.01.22.
//

import Foundation

class User: ObservableObject {
    var name: String = ""
    
    init(name: String) {
        self.name = name
    }
    
    @Published var savedName = UserDefaults.standard.string(forKey: "Name") ?? ""
}
