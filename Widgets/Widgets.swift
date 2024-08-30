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
            TrainTime(serviceType: "特急", platform: "1番線発", destination: "神戸三宮行", departureTime: Calendar.current.date(bySettingHour: 9, minute: 5, second: 0, of: Date())!, displayColor: .yellow),
            TrainTime(serviceType: "普通", platform: "2番線発", destination: "宝塚行", departureTime: Calendar.current.date(bySettingHour: 9, minute: 12, second: 0, of: Date())!, displayColor: .blue),
            TrainTime(serviceType: "準急", platform: "3番線発", destination: "大阪梅田行", departureTime: Calendar.current.date(bySettingHour: 9, minute: 20, second: 0, of: Date())!, displayColor: .yellow),
            TrainTime(serviceType: "特急", platform: "1番線発", destination: "神戸三宮行", departureTime: Calendar.current.date(bySettingHour: 9, minute: 28, second: 0, of: Date())!, displayColor: .red),
            TrainTime(serviceType: "普通", platform: "2番線発", destination: "宝塚行", departureTime: Calendar.current.date(bySettingHour: 9, minute: 35, second: 0, of: Date())!, displayColor: .blue),
            TrainTime(serviceType: "準急", platform: "3番線発", destination: "大阪梅田行", departureTime: Calendar.current.date(bySettingHour: 9, minute: 42, second: 0, of: Date())!, displayColor: .yellow),
            TrainTime(serviceType: "特急", platform: "1番線発", destination: "神戸三宮行", departureTime: Calendar.current.date(bySettingHour: 9, minute: 50, second: 0, of: Date())!, displayColor: .red),
            TrainTime(serviceType: "普通", platform: "2番線発", destination: "宝塚行", departureTime: Calendar.current.date(bySettingHour: 9, minute: 58, second: 0, of: Date())!, displayColor: .blue)
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
            TrainTime(serviceType: "特急", platform: "1番線発", destination: "神戸三宮行", departureTime: Calendar.current.date(bySettingHour: 9, minute: 5, second: 0, of: Date())!, displayColor: .yellow),
            TrainTime(serviceType: "普通", platform: "2番線発", destination: "宝塚行", departureTime: Calendar.current.date(bySettingHour: 9, minute: 12, second: 0, of: Date())!, displayColor: .blue),
            TrainTime(serviceType: "準急", platform: "3番線発", destination: "大阪梅田行", departureTime: Calendar.current.date(bySettingHour: 9, minute: 20, second: 0, of: Date())!, displayColor: .yellow),
            TrainTime(serviceType: "特急", platform: "1番線発", destination: "神戸三宮行", departureTime: Calendar.current.date(bySettingHour: 9, minute: 28, second: 0, of: Date())!, displayColor: .red),
            TrainTime(serviceType: "普通", platform: "2番線発", destination: "宝塚行", departureTime: Calendar.current.date(bySettingHour: 9, minute: 35, second: 0, of: Date())!, displayColor: .blue),
            TrainTime(serviceType: "準急", platform: "3番線発", destination: "大阪梅田行", departureTime: Calendar.current.date(bySettingHour: 9, minute: 42, second: 0, of: Date())!, displayColor: .yellow),
            TrainTime(serviceType: "特急", platform: "1番線発", destination: "神戸三宮行", departureTime: Calendar.current.date(bySettingHour: 9, minute: 50, second: 0, of: Date())!, displayColor: .red),
            TrainTime(serviceType: "普通", platform: "2番線発", destination: "宝塚行", departureTime: Calendar.current.date(bySettingHour: 9, minute: 58, second: 0, of: Date())!, displayColor: .blue)
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
            TrainTime(serviceType: "特急", platform: "1番線発", destination: "神戸三宮行", departureTime: Calendar.current.date(bySettingHour: 9, minute: 5, second: 0, of: Date())!, displayColor: .yellow),
            TrainTime(serviceType: "普通", platform: "2番線発", destination: "宝塚行", departureTime: Calendar.current.date(bySettingHour: 9, minute: 12, second: 0, of: Date())!, displayColor: .blue),
            TrainTime(serviceType: "準急", platform: "3番線発", destination: "大阪梅田行", departureTime: Calendar.current.date(bySettingHour: 9, minute: 20, second: 0, of: Date())!, displayColor: .yellow),
            TrainTime(serviceType: "特急", platform: "1番線発", destination: "神戸三宮行", departureTime: Calendar.current.date(bySettingHour: 9, minute: 28, second: 0, of: Date())!, displayColor: .red),
            TrainTime(serviceType: "普通", platform: "2番線発", destination: "宝塚行", departureTime: Calendar.current.date(bySettingHour: 9, minute: 35, second: 0, of: Date())!, displayColor: .blue),
            TrainTime(serviceType: "準急", platform: "3番線発", destination: "大阪梅田行", departureTime: Calendar.current.date(bySettingHour: 9, minute: 42, second: 0, of: Date())!, displayColor: .yellow),
            TrainTime(serviceType: "特急", platform: "1番線発", destination: "神戸三宮行", departureTime: Calendar.current.date(bySettingHour: 9, minute: 50, second: 0, of: Date())!, displayColor: .red),
            TrainTime(serviceType: "普通", platform: "2番線発", destination: "宝塚行", departureTime: Calendar.current.date(bySettingHour: 9, minute: 58, second: 0, of: Date())!, displayColor: .blue)
        ]

        let trainSchedule = TrainSchedule(
            name: "大阪梅田",
            company: "阪急",
            mainLine: "神戸線",
            direction: "新開地・神戸三宮方面",
            timetable: trainTimes
        )

        // Generate a timeline consisting of five entries an minute apart, starting from the current date.
        let currentDate = Date()
        for minuteOffset in 0 ..< 60 {
            let entryDate = Calendar.current.date(byAdding: .minute, value: minuteOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, timeTables: trainSchedule)
            entries.append(entry)
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
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let timeTables: TrainSchedule
}

struct WidgetsEntryView : View {
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
                        )
                    Text("\(entry.timeTables.direction)")
                        .font(.system(size: 6))
                }
            }
            Clock(minute: minute, timeTables: entry.timeTables.timetable)
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
            } else {
                WidgetsEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

#Preview(as: .systemSmall) {
    Widgets()
} timeline: {
    
    let trainTimes: [TrainTime] = [
        TrainTime(serviceType: "特急", platform: "1番線発", destination: "神戸三宮行", departureTime: Calendar.current.date(bySettingHour: 9, minute: 5, second: 0, of: Date())!, displayColor: .yellow),
        TrainTime(serviceType: "普通", platform: "2番線発", destination: "宝塚行", departureTime: Calendar.current.date(bySettingHour: 9, minute: 12, second: 0, of: Date())!, displayColor: .blue),
        TrainTime(serviceType: "準急", platform: "3番線発", destination: "大阪梅田行", departureTime: Calendar.current.date(bySettingHour: 9, minute: 20, second: 0, of: Date())!, displayColor: .yellow),
        TrainTime(serviceType: "特急", platform: "1番線発", destination: "神戸三宮行", departureTime: Calendar.current.date(bySettingHour: 9, minute: 28, second: 0, of: Date())!, displayColor: .red),
        TrainTime(serviceType: "普通", platform: "2番線発", destination: "宝塚行", departureTime: Calendar.current.date(bySettingHour: 9, minute: 35, second: 0, of: Date())!, displayColor: .blue),
        TrainTime(serviceType: "準急", platform: "3番線発", destination: "大阪梅田行", departureTime: Calendar.current.date(bySettingHour: 9, minute: 42, second: 0, of: Date())!, displayColor: .yellow),
        TrainTime(serviceType: "特急", platform: "1番線発", destination: "神戸三宮行", departureTime: Calendar.current.date(bySettingHour: 9, minute: 50, second: 0, of: Date())!, displayColor: .red),
        TrainTime(serviceType: "普通", platform: "2番線発", destination: "宝塚行", departureTime: Calendar.current.date(bySettingHour: 9, minute: 58, second: 0, of: Date())!, displayColor: .blue)
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
