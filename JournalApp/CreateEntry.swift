//
//  CreateEntry.swift
//  JournalApp
//
//  Created by Kathrine Heinzel on 11.01.22.
//

import SwiftUI

struct CreateEntry: View {
    @EnvironmentObject var entryController: EntryController
    @Environment(\.presentationMode) var presentationMode
    
    @State var title: String = ""
    @State var desc: String = ""
    @State var mood: String = ""
    
    @State private var entryMood = ""
    let entryMoods = ["Happy", "Ok", "Sad"]
    
    var body: some View {
        VStack {
            Form {
                Section {
                    TextField("Title", text: $title)
                    
                    Picker("Mood:", selection: $entryMood) {
                        ForEach(entryMoods, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    TextEditor(text: $desc)
                        .foregroundColor(.black)
                }
                
                Section {
                    Button(
                        action: {
                            self.entryController.createEntry(title: self.title, date: Date(), desc: self.desc, mood: self.entryMood)
                            self.presentationMode.wrappedValue.dismiss()
                        },
                        label: {
                            NavigationLink(destination: ContentView()) {
                                ButtonView()
                            }
                        }
                    )
                }
            }
        }
    }
}

struct ButtonView: View {
    let myCC = MyCustomColors();
    
    var body: some View {
        Text("Save")
            .frame(width: 200, alignment: .center)
            .padding()
            .background(myCC.oldPink)
            .foregroundColor(myCC.slate)
            .cornerRadius(12)
    }
}

struct CreateEntry_Previews: PreviewProvider {
    static var previews: some View {
        CreateEntry()
    }
}
