//
//  ClockTimeTableWidget.swift
//  WidgetsExtension
//
//  Created by 久乗建汰 on 2024/08/21.
//

import SwiftUI
import WidgetKit

struct ClockTimeTableWidget: Widget {
    let kind: String = "ClockTimeTableWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) {
            EntryView(entry: $0)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .configurationDisplayName("ClockTimeTable Widget")
        .description("電車の時刻表を時計型で表示するWidgetです")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}

#Preview(as: .systemSmall) {
    ClockTimeTableWidget()
} timeline: {
    ClockTimeTableWidget.Entry.placeholder
}

#Preview(as: .systemMedium) {
    ClockTimeTableWidget()
} timeline: {
    ClockTimeTableWidget.Entry.placeholder
}

#Preview(as: .systemLarge) {
    ClockTimeTableWidget()
} timeline: {
    ClockTimeTableWidget.Entry.placeholder
}
