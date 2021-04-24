//
//  AlarmItemView.swift
//  Alarm
//
//  Created by Niko Makris on 12.07.20.
//  Copyright © 2020 Niko Makris. All rights reserved.
//

import SwiftUI

struct AlarmItemView: View {
    
    @State private var alarmSetting = true
    
    var body: some View {
        VStack {
            ZStack {
            Circle()
            .fill(Color.blue)
            .frame(width: 175, height: 175)
                VStack{
                    Text("7:45 AM").foregroundColor(Color.white).fontWeight(.bold)
                    .padding(.top, 20)
                    Text("Weekdays").foregroundColor(Color.white).fontWeight(.medium)
                    .padding(.top, 10)
                    Button(action: {
                        self.alarmSetting.toggle()
                    }, label: {(
                        Circle()
                            .fill(!alarmSetting ? Color.green : Color.white)
                        .frame(width: 15, height: 15)
                        )}).padding(.top, 20)
                    
                }
                
            }
        }
    }
}

struct AlarmItemView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmItemView()
    }
}
