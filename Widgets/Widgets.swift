//
//  Widgets.swift
//  Widgets
//
//  Created by 久乗建汰 on 2024/08/30.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        let trainTimes: [TrainTime] = [
            TrainTime(serviceType: "特急", platform: "1番線発", destination: "神戸三宮行", departureTime: Calendar.current.date(bySettingHour: 3, minute: 0, second: 0, of: Date())!, displayColor: .yellow, isFirstTrain: true),
            TrainTime(serviceType: "普通", platform: "2番線発", destination: "宝塚行", departureTime: Calendar.current.date(bySettingHour: 3, minute: 8, second: 0, of: Date())!, displayColor: .blue, isFirstTrain: true),
            TrainTime(serviceType: "準急", platform: "3番線発", destination: "大阪梅田行", departureTime: Calendar.current.date(bySettingHour: 3, minute: 20, second: 0, of: Date())!, displayColor: .yellow, isFirstTrain: true),
            TrainTime(serviceType: "特急", platform: "1番線発", destination: "神戸三宮行", departureTime: Calendar.current.date(bySettingHour: 3, minute: 28, second: 0, of: Date())!, displayColor: .red, isFirstTrain: true),
            TrainTime(serviceType: "普通", platform: "2番線発", destination: "宝塚行", departureTime: Calendar.current.date(bySettingHour: 3, minute: 37, second: 0, of: Date())!, displayColor: .blue, isFirstTrain: true),
            TrainTime(serviceType: "準急", platform: "3番線発", destination: "大阪梅田行", departureTime: Calendar.current.date(bySettingHour: 3, minute: 49, second: 0, of: Date())!, displayColor: .yellow, isFirstTrain: true),
            TrainTime(serviceType: "特急", platform: "1番線発", destination: "神戸三宮行", departureTime: Calendar.current.date(bySettingHour: 3, minute: 50, second: 0, of: Date())!, displayColor: .red, isFirstTrain: true),
            TrainTime(serviceType: "普通", platform: "2番線発", destination: "宝塚行", departureTime: Calendar.current.date(bySettingHour: 2, minute: 58, second: 0, of: Date())!, displayColor: .blue, isFirstTrain: true)
        ]

        let trainSchedule = TrainSchedule(
            name: "大阪梅田",
            company: "阪急",
            mainLine: "神戸線",
            direction: "新開地・神戸三宮方面",
            timetable: trainTimes
        )
        return SimpleEntry(date: Date(), timeTables: trainSchedule)
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let trainTimes: [TrainTime] = [
            TrainTime(serviceType: "特急", platform: "1番線発", destination: "神戸三宮行", departureTime: Calendar.current.date(bySettingHour: 3, minute: 0, second: 0, of: Date())!, displayColor: .yellow, isFirstTrain: true),
            TrainTime(serviceType: "普通", platform: "2番線発", destination: "宝塚行", departureTime: Calendar.current.date(bySettingHour: 3, minute: 8, second: 0, of: Date())!, displayColor: .blue, isFirstTrain: true),
            TrainTime(serviceType: "準急", platform: "3番線発", destination: "大阪梅田行", departureTime: Calendar.current.date(bySettingHour: 3, minute: 20, second: 0, of: Date())!, displayColor: .yellow, isFirstTrain: true),
            TrainTime(serviceType: "特急", platform: "1番線発", destination: "神戸三宮行", departureTime: Calendar.current.date(bySettingHour: 3, minute: 28, second: 0, of: Date())!, displayColor: .red, isFirstTrain: true),
            TrainTime(serviceType: "普通", platform: "2番線発", destination: "宝塚行", departureTime: Calendar.current.date(bySettingHour: 3, minute: 37, second: 0, of: Date())!, displayColor: .blue, isFirstTrain: true),
            TrainTime(serviceType: "準急", platform: "3番線発", destination: "大阪梅田行", departureTime: Calendar.current.date(bySettingHour: 3, minute: 49, second: 0, of: Date())!, displayColor: .yellow, isFirstTrain: true),
            TrainTime(serviceType: "特急", platform: "1番線発", destination: "神戸三宮行", departureTime: Calendar.current.date(bySettingHour: 3, minute: 50, second: 0, of: Date())!, displayColor: .red, isFirstTrain: true),
            TrainTime(serviceType: "普通", platform: "2番線発", destination: "宝塚行", departureTime: Calendar.current.date(bySettingHour: 2, minute: 58, second: 0, of: Date())!, displayColor: .blue, isFirstTrain: true)
        ]

        let trainSchedule = TrainSchedule(
            name: "大阪梅田",
            company: "阪急",
            mainLine: "神戸線",
            direction: "新開地・神戸三宮方面",
            timetable: trainTimes
        )
        let entry = SimpleEntry(date: Date(), timeTables: trainSchedule)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        let trainTimes: [TrainTime] = [
            TrainTime(serviceType: "特急", platform: "1番線発", destination: "神戸三宮行", departureTime: Calendar.current.date(bySettingHour: 3, minute: 0, second: 0, of: Date())!, displayColor: .yellow, isFirstTrain: true),
            TrainTime(serviceType: "普通", platform: "2番線発", destination: "宝塚行", departureTime: Calendar.current.date(bySettingHour: 3, minute: 8, second: 0, of: Date())!, displayColor: .blue, isFirstTrain: true),
            TrainTime(serviceType: "準急", platform: "3番線発", destination: "大阪梅田行", departureTime: Calendar.current.date(bySettingHour: 3, minute: 20, second: 0, of: Date())!, displayColor: .yellow, isFirstTrain: true),
            TrainTime(serviceType: "特急", platform: "1番線発", destination: "神戸三宮行", departureTime: Calendar.current.date(bySettingHour: 3, minute: 34, second: 0, of: Date())!, displayColor: .red, isFirstTrain: true),
            TrainTime(serviceType: "普通", platform: "2番線発", destination: "宝塚行", departureTime: Calendar.current.date(bySettingHour: 3, minute: 37, second: 0, of: Date())!, displayColor: .blue, isFirstTrain: true),
            TrainTime(serviceType: "準急", platform: "3番線発", destination: "大阪梅田行", departureTime: Calendar.current.date(bySettingHour: 3, minute: 49, second: 0, of: Date())!, displayColor: .yellow, isFirstTrain: true),
            TrainTime(serviceType: "特急", platform: "1番線発", destination: "神戸三宮行", departureTime: Calendar.current.date(bySettingHour: 3, minute: 50, second: 0, of: Date())!, displayColor: .red, isFirstTrain: true),
            TrainTime(serviceType: "普通", platform: "2番線発", destination: "宝塚行", departureTime: Calendar.current.date(bySettingHour: 3, minute: 58, second: 0, of: Date())!, displayColor: .blue, isFirstTrain: true)
        ]
        
        let trainSchedule = TrainSchedule(
            name: "大阪梅田",
            company: "阪急",
            mainLine: "神戸線",
            direction: "新開地・神戸三宮方面",
            timetable: trainTimes
        )

        let currentDate = Date()
       for minuteOffset in 0 ..< 60 {
           let entryDate = Calendar.current.date(byAdding: .minute, value: minuteOffset, to: currentDate)!
           
           // まだ出発していない列車のみをフィルタリング
           let upcomingTrainTimes = trainTimes.filter { $0.departureTime > entryDate }
           
           if !upcomingTrainTimes.isEmpty {
               let filteredSchedule = TrainSchedule(
                   name: trainSchedule.name,
                   company: trainSchedule.company,
                   mainLine: trainSchedule.mainLine,
                   direction: trainSchedule.direction,
                   timetable: upcomingTrainTimes
               )
               let entry = SimpleEntry(date: entryDate, timeTables: filteredSchedule)
               entries.append(entry)
           }
       }

       let timeline = Timeline(entries: entries, policy: .atEnd)
       completion(timeline)
    }
}

// 時刻表情報を保持するクラス
struct TrainSchedule {
    var name: String
    var company: String
    var mainLine: String
    var direction: String
    var timetable: [TrainTime]
}

// 各列車の運行情報を保持するクラス
struct TrainTime: Hashable {
    var serviceType: String
    var platform: String
    var destination: String
    var departureTime: Date
    var displayColor: Color
    var isFirstTrain: Bool
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let timeTables: TrainSchedule
}

struct WidgetsEntryView : View {
    @Environment(\.widgetFamily) var family: WidgetFamily
    var entry: Provider.Entry

    var body: some View {
        switch family {
        case .systemSmall:
            SmallEntryView(entry: entry)
        case .systemMedium:
            MediumEntryView(entry: entry)
        @unknown default:
            SmallEntryView(entry: entry)
        }
    }
}

struct SmallEntryView : View {
    var entry: Provider.Entry
    var body: some View {
        let minute = Calendar.current.component(.minute, from: entry.date)
        return ZStack {
            VStack(spacing: 20) {
                Text(entry.timeTables.name)
                    .font(.system(size: 10))
                    .bold()
                VStack {
                    RoundedRectangle(cornerRadius: 2)
                        .fill(.red)
                        .frame(width: 50, height: 12)
                        .overlay(
                            Text("\(entry.timeTables.company) \(entry.timeTables.mainLine)")
                                .font(.system(size: 8))
                                .bold()
                        )
                    Text("\(entry.timeTables.direction)")
                        .font(.system(size: 6))
                        .bold()
                }
            }
            Clock(minute: minute, timeTables: entry.timeTables.timetable)
        }
    }
}

struct MediumEntryView : View {
    var entry: Provider.Entry
    
    var body: some View {
        let minute = Calendar.current.component(.minute, from: entry.date)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        return HStack(spacing: 0) {
            Clock(minute: minute, timeTables: entry.timeTables.timetable)
            VStack {
                VStack {
                    HStack {
                        RoundedRectangle(cornerRadius: 4)
                            .foregroundColor(.red)
                            .frame(width:64, height: 18)
                            .overlay(
                                HStack(spacing: 2) {
                                    Text("\(entry.timeTables.company)")
                                        .foregroundColor(.white)
                                        .font(.system(size: 10))
                                        .bold()
                                    Text("\(entry.timeTables.mainLine)")
                                        .foregroundColor(.white)
                                        .font(.system(size: 10))
                                        .bold()
                                }
                            )
                        Text("\(entry.timeTables.direction)")
                            .font(.system(size: 10))
                        Spacer()
                    }
                    HStack {
                        Text("\(entry.timeTables.name)")
                            .font(.system(size: 18))
                            .bold()
                        Spacer()
                    }
                }
                Rectangle().fill(.gray).frame(height: 1).padding(.horizontal, 4)
                HStack(spacing: 6) {
                    VStack {
                        Text("\(dateFormatter.string(from: entry.timeTables.timetable[0].departureTime))")
                            .font(.system(size: 14))
                            .bold()
                        Spacer()
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("\(entry.timeTables.timetable[0].destination)")
                            .font(.system(size: 14))
                        HStack {
                            RoundedRectangle(cornerRadius: 2)
                                .stroke(entry.timeTables.timetable[0].displayColor, lineWidth: 2)
                                .frame(width:32, height: 18)
                                .overlay(
                                    Text("\(entry.timeTables.timetable[0].serviceType)")
                                        .font(.system(size: 14))
                                )
                            RoundedRectangle(cornerRadius: 2)
                                .stroke(.gray, lineWidth: 2)
                                .frame(width:52, height: 18)
                                .overlay(
                                    Text("\(entry.timeTables.timetable[0].platform)")
                                        .font(.system(size: 14))
                                )
                            RoundedRectangle(cornerRadius: 2)
                                .foregroundColor(.green)
                                .frame(width:18, height: 18)
                                .overlay(
                                    Text("始")
                                        .foregroundColor(.white)
                                        .font(.system(size: 14))
                                        .bold()
                                )
                        }
                        Spacer()
                    }
                    Spacer()
                }
                Spacer()
            }
            .padding(.vertical, 16)
            .frame(width: 180, height: 158)
        }
    }
}

struct Widgets: Widget {
    let kind: String = "Widgets"
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                WidgetsEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
//                    .background(
//                        Image("background")
//                            .resizable()
//                            .edgesIgnoringSafeArea(.all)
//                    )
            } else {
                WidgetsEntryView(entry: entry)
                    .padding()
            }
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

#Preview(as: .systemSmall) {
    Widgets()
} timeline: {
    
    let trainTimes: [TrainTime] = [
        TrainTime(serviceType: "特急", platform: "1番線発", destination: "神戸三宮行", departureTime: Calendar.current.date(bySettingHour: 3, minute: 0, second: 0, of: Date())!, displayColor: .yellow, isFirstTrain: true),
        TrainTime(serviceType: "普通", platform: "2番線発", destination: "宝塚行", departureTime: Calendar.current.date(bySettingHour: 3, minute: 8, second: 0, of: Date())!, displayColor: .blue, isFirstTrain: true),
        TrainTime(serviceType: "準急", platform: "3番線発", destination: "大阪梅田行", departureTime: Calendar.current.date(bySettingHour: 3, minute: 20, second: 0, of: Date())!, displayColor: .yellow, isFirstTrain: true),
        TrainTime(serviceType: "特急", platform: "1番線発", destination: "神戸三宮行", departureTime: Calendar.current.date(bySettingHour: 3, minute: 28, second: 0, of: Date())!, displayColor: .red, isFirstTrain: true),
        TrainTime(serviceType: "普通", platform: "2番線発", destination: "宝塚行", departureTime: Calendar.current.date(bySettingHour: 3, minute: 37, second: 0, of: Date())!, displayColor: .blue, isFirstTrain: true),
        TrainTime(serviceType: "準急", platform: "3番線発", destination: "大阪梅田行", departureTime: Calendar.current.date(bySettingHour: 3, minute: 49, second: 0, of: Date())!, displayColor: .yellow, isFirstTrain: true),
        TrainTime(serviceType: "特急", platform: "1番線発", destination: "神戸三宮行", departureTime: Calendar.current.date(bySettingHour: 3, minute: 50, second: 0, of: Date())!, displayColor: .red, isFirstTrain: true),
        TrainTime(serviceType: "普通", platform: "2番線発", destination: "宝塚行", departureTime: Calendar.current.date(bySettingHour: 2, minute: 58, second: 0, of: Date())!, displayColor: .blue, isFirstTrain: true)
    ]

    let trainSchedule = TrainSchedule(
        name: "大阪梅田",
        company: "阪急",
        mainLine: "神戸線",
        direction: "新開地・神戸三宮方面",
        timetable: trainTimes
    )
    SimpleEntry(date: .now, timeTables: trainSchedule)
}

#Preview(as: .systemMedium) {
    Widgets()
} timeline: {
    
    let trainTimes: [TrainTime] = [
        TrainTime(serviceType: "特急", platform: "1番線発", destination: "神戸三宮行", departureTime: Calendar.current.date(bySettingHour: 3, minute: 0, second: 0, of: Date())!, displayColor: .yellow, isFirstTrain: true),
        TrainTime(serviceType: "普通", platform: "2番線発", destination: "宝塚行", departureTime: Calendar.current.date(bySettingHour: 3, minute: 8, second: 0, of: Date())!, displayColor: .blue, isFirstTrain: true),
        TrainTime(serviceType: "準急", platform: "3番線発", destination: "大阪梅田行", departureTime: Calendar.current.date(bySettingHour: 3, minute: 20, second: 0, of: Date())!, displayColor: .yellow, isFirstTrain: true),
        TrainTime(serviceType: "特急", platform: "1番線発", destination: "神戸三宮行", departureTime: Calendar.current.date(bySettingHour: 3, minute: 28, second: 0, of: Date())!, displayColor: .red, isFirstTrain: true),
        TrainTime(serviceType: "普通", platform: "2番線発", destination: "宝塚行", departureTime: Calendar.current.date(bySettingHour: 3, minute: 37, second: 0, of: Date())!, displayColor: .blue, isFirstTrain: true),
        TrainTime(serviceType: "準急", platform: "3番線発", destination: "大阪梅田行", departureTime: Calendar.current.date(bySettingHour: 3, minute: 49, second: 0, of: Date())!, displayColor: .yellow, isFirstTrain: true),
        TrainTime(serviceType: "特急", platform: "1番線発", destination: "神戸三宮行", departureTime: Calendar.current.date(bySettingHour: 3, minute: 50, second: 0, of: Date())!, displayColor: .red, isFirstTrain: true),
        TrainTime(serviceType: "普通", platform: "2番線発", destination: "宝塚行", departureTime: Calendar.current.date(bySettingHour: 2, minute: 58, second: 0, of: Date())!, displayColor: .blue, isFirstTrain: true)
    ]

    let trainSchedule = TrainSchedule(
        name: "大阪梅田",
        company: "阪急",
        mainLine: "神戸線",
        direction: "新開地・神戸三宮方面",
        timetable: trainTimes
    )
    SimpleEntry(date: .now, timeTables: trainSchedule)
}
