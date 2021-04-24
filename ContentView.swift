//
//  ContentView.swift
//  Alarm
//
//  Created by Niko Makris on 12.07.20.
//  Copyright © 2020 Niko Makris. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var dayClicked: Bool = false
    @State private var showMedicineView: Bool = false
    @State var selectedMenu = "All"
    @State var selected = Date.dayOfWeek(Date())()
    let now = Date()
    @State var index: Int = 0
    
    
    var days = ["Saturday","Sunday","Monday","Tuesday","Wednesday","Thursday", "Friday"]
    var schedules = [Schedule(id: "2", name: "Omega 3", reason: "Test", quantitiy: 3, repetition: "Saturday"),Schedule(id: "2", name: "Omega 3", reason: "Test", quantitiy: 3, repetition: "Saturday"),Schedule(id: "2", name: "Omega 3", reason: "Test", quantitiy: 3, repetition: "Friday"),Schedule(id: "2", name: "Omega 3", reason: "Test", quantitiy: 3, repetition: "Saturday"),Schedule(id: "2", name: "Omega 3", reason: "Test", quantitiy: 3, repetition: "Saturday"), Schedule(id: "2", name: "Omega 3", reason: "Test", quantitiy: 3, repetition: "Saturday"), Schedule(id: "2", name: "Omega 3", reason: "Test", quantitiy: 3, repetition: "Tuesday"), Schedule(id: "2", name: "Omega 3", reason: "Test", quantitiy: 3, repetition: "Friday"), Schedule(id: "2", name: "Omega 3", reason: "Test", quantitiy: 3, repetition: "Saturday"), Schedule(id: "2", name: "Omega 3", reason: "Test", quantitiy: 3, repetition: "Saturday")]
    
    var filteredSchedules: [Schedule] {
        return schedules.filter {$0.repetition == selected}
    }
    
    enum Weekdays: String, CaseIterable {
        case Saturday = "Saturday"
        case Sunday = "Sunday"
        case Monday = "Monday"
        case Tuesday = "Tuesday"
        case Wednesday = "Wednesday"
        case Thursday = "Thursday"
        case Friday = "Friday"
    }
    
    func getDate() -> String {
        let time = Date()
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "MMM d,yyyy"
        let stringDate = timeFormatter.string(from: time)
        return stringDate
    }
    
    func todayCheck(day: String) -> Bool {
        if Date.dayOfWeek(Date())() == day {
            return true
        } else {
            return false
        }
    }
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                
                HStack {
                    Spacer()
                    Spacer()
                    Text("today, \(getDate())")
                        .fontWeight(.bold)
                        .padding(.trailing, 10)
                        
                        .padding()
                }
                
                HStack(alignment: .center, spacing: 25.0, content: {
                    ForEach(days, id: \.self) { day in
                        DayButton(day: day, selected: self.$selected, index: self.$index)
                    }
                })
                .padding(20)
                
                if !filteredSchedules.isEmpty {
                ForEach(filteredSchedules, id: \.self) { schedule in
                    
                        NavigationLink(destination: ScheduleDetailView()) {
                            ScheduleView(schedule: schedule).padding()
                        }.buttonStyle(PlainButtonStyle())
                    }
                }
                else {
                    VStack(alignment: .center, spacing: 20) {
                        Image("empty")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350, height: 250, alignment: .center)
                        Text("No medication is taken on that day.")
                            .foregroundColor(Color.white.opacity(0.7))
                            .font(.system(size: 16))
                    }.padding()
                }
                
            }.navigationBarTitle("Schedules")
            .navigationBarItems(leading: Text("Edit").foregroundColor(Color("main")) ,trailing:
                                    Button(action: {
                                        self.showMedicineView.toggle()
                                    }) {
                                        Image(systemName: "plus").foregroundColor(Color("main"))
                                    }.sheet(isPresented: $showMedicineView) { MedicineView()
                                    }
            )
            
        }
    }
}



struct DayButton: View {
    
    var day : String
    @Binding var selected : String
    @Binding var index: Int
    
    var body: some View{
        
        Button(action: {
            self.selected = self.day
            
        }) {
            Text(day.prefix(2))
                .fontWeight(selected == day ? .bold : .none)
                .foregroundColor(selected == day ? .white : Color.white.opacity(0.7))
                .font(.system(size: 15))
        }
        .frame(width: 30, height: 30, alignment: .center)
        .background(selected == day ? Color("main") : Color.black)
        .clipShape(Circle())
    }
    
}

extension Date {
    func dayOfWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self).capitalized
        // or use capitalized(with: locale) if you want
    }
}

struct ScheduleDetailView: View {
    
    var body: some View {
        VStack {
            Text("yo")
        }
    }
}

struct MedicineView: View {
    
    @State private var medicineName: String = ""
    @State private var reason: String = ""
    @State private var quantity: String = ""
    @State private var isNotificationOn: Bool = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("MAIN INFORMATION")) {
                    HStack {
                        Text("Name")
                        Spacer()
                        TextField("Required", text: $medicineName)
                    }
                    HStack {
                        Text("Reason")
                        Spacer()
                        TextField("Optional", text: $reason)
                    }
                    HStack {
                        Text("Quantitiy")
                        Spacer()
                        TextField("1", text: $quantity)
                    }
                }
                Section(header: Text("VIEW")) {
                    HStack(spacing: 20) {
                        Text("Name")
                        TextField("Required", text: $medicineName)
                    }
                    
                }
                
                    VStack(spacing: 20) {
                        Text("Name")
                        TextField("Required", text: $medicineName)
                    }
                    .frame(width: 200, height: 200, alignment: .center)
                    .background(Color("bg"))
                    .cornerRadius(10.0)
             
                
                
                Section(header: Text("NOTIFICATIONS"), footer: Text("The reminder may be repeated.")) {
                    HStack {
                        Toggle(isOn: $isNotificationOn) {
                            Text("Notifications are disabled")
                        }
                    }
                    HStack {
                        Toggle(isOn: $isNotificationOn) {
                            Text("Notifications are disabled")
                        }
                    }
                    HStack {
                        Toggle(isOn: $isNotificationOn) {
                            Text("Notifications are disabled")
                        }
                    }
                    
                }
                
                Section(header: Text("")) {
                    HStack {
                        Toggle(isOn: $isNotificationOn) {
                            Text("Notifications are disabled")
                        }
                    }
                    HStack {
                        Toggle(isOn: $isNotificationOn) {
                            Text("Notifications are disabled")
                        }
                    }
                    HStack {
                        Toggle(isOn: $isNotificationOn) {
                            Text("Notifications are disabled")
                        }
                    }
                    
                }
                
                
            }
            .navigationBarTitle("Add medicine")
        }
    }
}

struct ScheduleView: View {
    
    var schedule: Schedule
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 30.0) {
                
                Image("pill")
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .leading)
                    .padding(.leading, 10)
                    
                VStack(alignment: .leading, spacing: 5.0) {
                    Text(schedule.name)
                        .font(.system(size: 17, weight: .bold, design: .default))
                    Text(schedule.reason)
                        .font(.system(size: 15, weight: .medium, design: .default)).foregroundColor(Color.gray)
                }
                Text("\(schedule.quantitiy) capsules")
                    .fontWeight(.light)
                Image(systemName: "arrow.right.square.fill")
                    .resizable()
                    .frame(width: 20, height: 20, alignment: .leading)
                
            }.padding(10)
        }
        .background(Color("bg"))
        .cornerRadius(13.0)
        
    }
}

struct LongPressGestureView: View {
    @GestureState var isDetectingLongPress = false
    @State var completedLongPress = false

    var longPress: some Gesture {
        LongPressGesture(minimumDuration: 3)
            .updating($isDetectingLongPress) { currentstate, gestureState,
                    transaction in
                gestureState = currentstate
                transaction.animation = Animation.easeIn(duration: 2.0)
            }
            .onEnded { finished in
                self.completedLongPress = finished
            }
    }

    var body: some View {
        Circle()
            .fill(self.isDetectingLongPress ?
                Color.red :
                (self.completedLongPress ? Color.green : Color.blue))
            .frame(width: 100, height: 100, alignment: .center)
            .gesture(longPress)
    }
}

struct Schedule: Identifiable, Hashable{
    
    var id: String
    var name: String
    var reason: String
    var quantitiy: Int
    var repetition: String
}

enum Repetition {
    case everyDay
    case everyWeek
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
