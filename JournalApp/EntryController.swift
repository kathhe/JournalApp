//
//  EntryController.swift
//  JournalApp
//
//  Created by Kathrine Heinzel on 15.01.22.
//

import Foundation

class EntryController: ObservableObject {
    @Published var entries: [EntrySection] = []
    @Published var entryCount: Int = 0

    func createEntry (title: String, date: Date, desc: String, mood: String) {
        let newEntry = EntrySection(title: title, date: date, desc: desc, mood: mood)
        entries.append(newEntry)
    }

    func deleteEntry(at index: Int) {
        entries.remove(at: index)
    }
    
    func updateEntry(entry: EntrySection, desc: String) {
        if let index = entries.firstIndex(of: entry) {
            var entry = entries[index]
            entry.desc = desc
            
            entries[index] = entry
        }
    }
    
    func countEntries(entries: [EntrySection]) -> Int {
        return entries.count;
    }
    
    func listAllEntries() {
        print(self.entries);
    }
    
}

