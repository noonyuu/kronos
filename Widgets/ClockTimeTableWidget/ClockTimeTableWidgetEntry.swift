//
//  ClockTimeTableWidgetEntry.swift
//  WidgetsExtension
//
//  Created by 久乗建汰 on 2024/08/22.
//

import WidgetKit

extension ClockTimeTableWidget {
    struct Entry: TimelineEntry {
        var date: Date = .now
        var emoji: String = "😀"
    }
}

extension ClockTimeTableWidget.Entry {
    static var placeholder: Self {
        .init()
    }
}
