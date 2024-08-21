//
//  ClockTimeTableWidgetProvider.swift
//  WidgetsExtension
//
//  Created by 久乗建汰 on 2024/08/22.
//

import WidgetKit

extension ClockTimeTableWidget {
    struct Provider: TimelineProvider {
        func placeholder(in context: Context) -> Entry {
            .placeholder
        }

        func getSnapshot(in context: Context, completion: @escaping (Entry) -> Void) {
            completion(.placeholder)
        }

        func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
            var entries: [Entry] = []

            // Generate a timeline consisting of five entries an hour apart, starting from the current date.
            let currentDate = Date()
            for hourOffset in 0 ..< 5 {
                let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
                entries.append(.init(date: entryDate, emoji: "😀"))
            }

            let timeline = Timeline(entries: entries, policy: .atEnd)
            completion(timeline)
        }
    }
}
