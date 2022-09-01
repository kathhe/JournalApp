//
//  SettingsView.swift
//  JournalApp
//
//  Created by Kathrine Heinzel on 16.01.22.
//

import SwiftUI

struct SettingsView: View {
    @State private var timeReminder = Date.now
    @State private var showTimePicker = true
    @EnvironmentObject var entryUser: User
    @State private var tapCount = UserDefaults.standard.object(forKey: "Name")
   
    var body: some View {
        List {
            Section {
                TextField("Name", text: $entryUser.name)
            }
            
            Toggle("Activate reminder", isOn: $showTimePicker)
            
            if showTimePicker {
                Button("Request Permission") {
                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                        if success {
                            print("Permission aquired")
                        } else if let error = error {
                            print(error.localizedDescription)
                        }
                    }
                }
                
                DatePicker("Remind me at", selection: $timeReminder, displayedComponents: .hourAndMinute)

                Button(
                    action: {
                        let content = UNMutableNotificationContent()
                        content.title = "Good day!"
                        content.subtitle = "Time to record your daily journal entry."
                        content.sound = UNNotificationSound.default
                        
                        let calendar = Calendar.current
                        let hour = calendar.component(.hour, from: timeReminder)
                        let minute = calendar.component(.minute, from: timeReminder)
                        
                        var dateC = DateComponents()
                        dateC.hour = hour
                        dateC.minute = minute

                        // show this notification five seconds from now
                        let trigger = 
                        UNCalendarNotificationTrigger(dateMatching: dateC, repeats: true)

                        // choose a random identifier
                        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                        // add our notification request
                        UNUserNotificationCenter.current().add(request)
                    },
                    label: {
                        Text("Schedule Reminder")
                            .background(Color.blue)
                            .foregroundColor(Color.white)
                            .frame(
                                width: 200,
                                height: 40
                            )
                    }
                ).disabled(timeReminder == Date.now)
                    .background(Color.blue)
                    .cornerRadius(8)
                    .padding([.top, .bottom], 16)
                    
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(User(name: "Username"))
    }
}
