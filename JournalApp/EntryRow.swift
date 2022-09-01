//
//  EntryRow.swift
//  JournalApp
//
//  Created by Kathrine Heinzel on 20.12.21.
//

import SwiftUI

struct EntryRow: View {
    let item: EntrySection
    var myCustomColor = MyCustomColors()
    
    var body: some View {
        HStack {

            VStack(alignment: .leading) {
                HStack{
                    VStack {
                        Text(item.getDateString(date: item.date))
                            .font(.system(size: 13))
                            .padding()
                            .background(myCustomColor.oldPink)
                            .cornerRadius(7)
                        Text(item.mood)
                            .font(.system(size: 12))
                        
                    }
                    .padding(10)
                    
                    VStack(alignment: .leading) {
                        Text(item.title)
                            .font(.headline)
                        Text(item.desc)
                            .frame(height: 50)
                            .truncationMode(.tail)
                    }
                }
            }
        }
    }
}

struct EntryRow_Previews: PreviewProvider {
    static var previews: some View {
        EntryRow(item: EntrySection.example)
    }
}
