//
//  AlarmConfigurationView.swift
//  Alarm
//
//  Created by Niko Makris on 12.07.20.
//  Copyright © 2020 Niko Makris. All rights reserved.
//

import SwiftUI

struct AlarmConfigurationView: View {
    
    @State private var timeFrameSetting: Bool = false
    @State private var days: Bool = false
    
    private let lineWidth: CGFloat = 44.0
    
    var body: some View {
        ZStack
            {
                Color.orange
                    .edgesIgnoringSafeArea(.all)
                
                // Your other content here
                // Other layers will respect the safe area edges
                
                VStack{
                    ZStack {
                        Circle()
                        .fill(Color.gray)
                            .frame(width: 450, height: 450).padding(.bottom, 165)
                        ZStack {
                            self.createPoint(valuePosition: 6, radius: 200)
                            self.createPoint(valuePosition: 7, radius: 200)
                            self.createPoint(valuePosition: 8, radius: 200)
                            self.createPoint(valuePosition: 9, radius: 200)
                            self.createPoint(valuePosition: 10, radius: 200)
                            self.createPoint(valuePosition: 11, radius: 200)
                            self.createPoint(valuePosition: 12, radius: 200)
                        }
                        
                    }
                       
                        .opacity(0.5)
                    HStack(alignment: .center, content: {
                        Text("11:45").fontWeight(.bold).font(.system(size: 46.0)).foregroundColor(Color.white)
                        .padding(.trailing, 40)
                        Button(action: {
                            self.timeFrameSetting.toggle()
                        }, label: {(
                            ZStack {
                                Circle()
                                .fill(Color.white)
                                .frame(width: 45, height: 45)
                                    
                                Text("AM").foregroundColor(Color.gray)
                                .fontWeight(.bold).font(.system(size: 18.0))
                            }
                            )})
                    })
                    
                    HStack(alignment: .bottom, spacing: 30, content: {
                        Button(action: {
                            self.days.toggle()
                        }, label: {(
                            Circle()
                            .fill(Color.white)
                            .frame(width: 45, height: 45)
                            )})
                        Button(action: {
                            self.days.toggle()
                        }, label: {(
                            Circle()
                            .fill(Color.white)
                            .frame(width: 45, height: 45)
                            )})
                        Button(action: {
                            self.days.toggle()
                        }, label: {(
                            Circle()
                            .fill(Color.white)
                            .frame(width: 45, height: 45)
                            )})
                        Button(action: {
                            self.days.toggle()
                        }, label: {(
                            Circle()
                            .fill(Color.white)
                            .frame(width: 45, height: 45)
                            )})
                    }).padding(.top, 10)
                    
                    HStack(alignment: .bottom, spacing: 30, content: {
                        Button(action: {
                            self.days.toggle()
                        }, label: {(
                            Circle()
                            .fill(Color.white)
                            .frame(width: 45, height: 45)
                            )})
                        Button(action: {
                            self.days.toggle()
                        }, label: {(
                            Circle()
                            .fill(Color.white)
                            .frame(width: 45, height: 45)
                            )})
                        Button(action: {
                            self.days.toggle()
                        }, label: {(
                            Circle()
                            .fill(Color.white)
                            .frame(width: 45, height: 45)
                            )})
                        Button(action: {
                            self.days.toggle()
                        }, label: {(
                            Circle()
                            .fill(Color.white)
                            .frame(width: 45, height: 45)
                            )})
                    }).padding(.top, 10)
                }
                
        }
        
        
        
    }
    private func createPoint(valuePosition: Double, radius: CGFloat) -> some View {
        let pointWidth: CGFloat = 40.0
        let angle = CGFloat(valuePosition / 12 * 2 * .pi - .pi / 2)
        let center = CGPoint(x: radius, y: radius)
        let radius = radius - lineWidth / 2.0 - 19.0
        let x = center.x + radius * cos(angle)
        let y = center.y + radius * sin(angle)
        let pointCenter = CGPoint(x: x, y: y)
        let rect = CGRect(
            x: pointCenter.x - pointWidth / 40.0,
            y: pointCenter.y - pointWidth / 6.0,
            width: pointWidth,
            height: pointWidth)
      
        return
            ZStack {
                Path { path in
                    path.addEllipse(in: rect)
                    Text("6")
                }.foregroundColor(.green)
                
        }
    }
    
    
}

struct AlarmConfigurationView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmConfigurationView()
    }
}
