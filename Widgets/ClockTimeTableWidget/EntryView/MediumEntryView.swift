//
//  MediumEntryView.swift
//  WidgetsExtension
//
//  Created by 久乗建汰 on 2024/08/22.
//

import SwiftUI

extension ClockTimeTableWidget.EntryView {
    struct MediumEntryView : View {
        var entry: ClockTimeTableWidget.Provider.Entry
        var body: some View {
            VStack {
                Text("Midium")
                Text("Time:")
                Text(entry.date, style: .time)

                Text("Emoji:")
                Text(entry.emoji)
            }
        }
    }
}
