//
//  EntryDetail.swift
//  JournalApp
//
//  Created by Kathrine Heinzel on 20.12.21.
//

import SwiftUI

struct EntryDetail: View {
    let entry: EntrySection
    
    var body: some View {
        
        VStack {
            Text(entry.title)
            Text(entry.getDateString(date: entry.date))
            Text(entry.desc)
                .padding()
            Spacer()
        }
        .navigationTitle(entry.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct EntryDetail_Previews: PreviewProvider {
    static var previews: some View {
        EntryDetail(entry: EntrySection.example)
    }
}
