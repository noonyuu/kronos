//
//  ClockTimeTableWidgetEntryView.swift
//  WidgetsExtension
//
//  Created by 久乗建汰 on 2024/08/22.
//

import SwiftUI
import WidgetKit

extension ClockTimeTableWidget {
    struct EntryView: View {
        @Environment(\.widgetFamily) var family: WidgetFamily
        var entry: Provider.Entry

        var body: some View {
            switch family {
            case .systemSmall:
                SmallEntryView(entry: entry)
            case .systemMedium:
                MediumEntryView(entry: entry)
            case .systemLarge:
                LargeEntryView(entry: entry)
            @unknown default:
                SmallEntryView(entry: entry)
            }
        }
    }
}
