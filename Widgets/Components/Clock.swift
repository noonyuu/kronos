//
//  Clock.swift
//  kronos
//
//  Created by 久乗建汰 on 2024/08/30.
//

import SwiftUI

let size: CGFloat = 158

struct Clock: View {
    var minute: Int
    var timeTables: [TrainTime]
    
    var body: some View {
        ZStack {
            ClockNumbers(timeTables: timeTables)
            ClockDots(timeTables: timeTables)
            CustomTimeDots(timeTables: timeTables)
            ClockHandsView(lineWidth: 3, minute: minute)
        }
        .frame(width: size, height: size)
    }
    
    struct ClockNumbers: View {
        var timeTables: [TrainTime]
        
        var body: some View {
            ForEach(0..<12) { number in
                let minuteMark = (number + 1) % 12 * 5
                let matchingTimeTable = timeTables.first { Calendar.current.component(.minute, from: $0.departureTime) == minuteMark }
                let color = matchingTimeTable?.displayColor ?? .black

                Text(String(number + 1))
                    .font(.callout)
                    .position(circularPosition(for: minuteMark, radius: size / 2 - 20, size: size))
                Rectangle()
                    .frame(width: 2, height: 6)
                    .rotationEffect(angleForDot(at: minuteMark))
                    .position(circularPosition(for: minuteMark, radius: size / 2 - 32, size: size))
                    .foregroundColor(color)
            }
        }
    }
    
    struct ClockDots: View {
        var timeTables: [TrainTime]
        
        var body: some View {
            ForEach(0..<60) { number in
                let matchingTimeTable = timeTables.first { Calendar.current.component(.minute, from: $0.departureTime) == number }
                let color = matchingTimeTable?.displayColor ?? .black

                Rectangle()
                    .frame(width: 2, height: 2)
                    .rotationEffect(angleForDot(at: number))
                    .position(circularPosition(for: number, radius: size / 2 - 36, size: size))
                    .foregroundColor(color) // ここで色を設定
            }
        }
    }
    
    struct CustomTimeDots: View {
        var timeTables: [TrainTime]
        
        var body: some View {
            ForEach(timeTables, id: \.self) { timeTable in
                Rectangle()
                    .frame(width: 2, height: 6)
                    .foregroundColor(timeTable.displayColor)
                    .rotationEffect(angleForDot(at: Calendar.current.component(.minute, from: timeTable.departureTime)))
                    .position(circularPosition(for: Calendar.current.component(.minute, from: timeTable.departureTime), radius: size / 2 - 40, size: size))
            }
        }
    }
    
    struct ClockHandsView: View {
        var lineWidth: CGFloat
        var minute: Int
        
        var body: some View {
            ZStack {
                Triangle()
                    .fill(.gray)
                    .frame(width: 8, height: 10)
                    .offset(y: -(size / 2 - 54) - 5)
                
                Path { path in
                    path.move(to: CGPoint(x: size / 2, y: size / 2))
                    path.addLine(to: CGPoint(x: size / 2, y: size / 2 - (size / 2 - 54)))
                }
                .stroke(Color(.gray), lineWidth: lineWidth)
                Circle()
                    .fill(.gray)
                    .frame(width: 6, height: 6)
            }
            .rotationEffect(.degrees(Double(minute * 6)))
        }
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.closeSubpath()
        }
    }
}

func circularPosition(for index: Int, radius: CGFloat, size: CGFloat) -> CGPoint {
    let angle = Angle.degrees(Double(index - 15) / 60.0 * 360.0)
    let x = radius * cos(CGFloat(angle.radians)) + (size / 2)
    let y = radius * sin(CGFloat(angle.radians)) + (size / 2)
    return CGPoint(x: x, y: y)
}

func angleForDot(at index: Int) -> Angle {
    return Angle.degrees(Double(index) / 60.0 * 360.0)
}
