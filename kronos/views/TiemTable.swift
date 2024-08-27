//
//  TimeTable.swift
//  kronos
//
//  Created by shimizu on 2024/08/25
//

import SwiftUI

struct TimeTable: View {
    @State private var selectedTab = 0
    let scheduleItems = [
        ScheduleItem(hour: "05", time: "05:00", type: "普通", destination: "新開地"),
        ScheduleItem(hour: "05", time: "05:20", type: "普通", destination: "新開地"),
        ScheduleItem(hour: "06", time: "06:00", type: "急行", destination: "神戸三宮"),
        ScheduleItem(hour: "06", time: "06:00", type: "急行", destination: "神戸三宮"),
        ScheduleItem(hour: "06", time: "06:00", type: "急行", destination: "神戸三宮"),
        ScheduleItem(hour: "06", time: "06:00", type: "急行", destination: "神戸三宮"),
        ScheduleItem(hour: "06", time: "06:15", type: "普通", destination: "新開地")
    ]
    
    let holiday = [
        ScheduleItem(hour: "07", time: "05:00", type: "普通", destination: "新開地"),
        ScheduleItem(hour: "07", time: "05:20", type: "普通", destination: "新開地"),
        ScheduleItem(hour: "07", time: "06:00", type: "急行", destination: "神戸三宮"),
        ScheduleItem(hour: "08", time: "06:00", type: "急行", destination: "神戸三宮"),
        ScheduleItem(hour: "08", time: "06:00", type: "急行", destination: "神戸三宮"),
        ScheduleItem(hour: "09", time: "06:00", type: "急行", destination: "神戸三宮"),
        ScheduleItem(hour: "09", time: "06:15", type: "普通", destination: "新開地")
    ]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 16) {
                    Divider()
                    VStack{
                        HStack{
                            VStack{
                                // 駅名(読み)
                                Text("おおさかうめだ")
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                    .padding(.leading, 24)
                                // 駅名(正式)
                                HStack{
                                    Text("大阪梅田")
                                        .font(.title)
                                        .bold()
                                        .padding(.leading, 24)
                                    // 線
                                    Text("(阪急線)")
                                        .font(.title)
                                        .bold()
                                    Spacer()
                                }
                                HStack {
                                    // 路線
                                    Text("阪急神戸本線")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 4)
                                        .background(Color(red: 0.38, green: 0.13, blue: 0.20))
                                        .cornerRadius(4)
                                        .padding(.leading, 24)
                                    // 方面
                                    Text("新開地・神戸三宮方面")
                                        .font(.subheadline)
                                        .foregroundColor(.black)
                                    
                                    Spacer()
                                }
                            }
                            // ブックマークアイコン
                            Image(systemName: "bookmark")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20)
                        }
                        HStack {
                            Picker("=", selection: $selectedTab) {
                                Text("平日").tag(0)
                                Text("休日").tag(1)
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .padding()
                            .frame(width: 160)
                            Spacer()
                            Button(action:{
                                // TODO: 絞り込みの処理
                            }) {
                                Label("絞り込み", image: "tune")
                                    .font(.body)
                                    .foregroundColor(.gray)
                                    .padding(8)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 16)
                                            .stroke(Color.gray)
                                    )
                            }
                        }
                    }
                }
                .padding(.horizontal)
                // 時刻表
                ScrollView {
                    VStack {
                        ForEach(groupedItems(), id: \.hour) { group in
                            HStack {
                                Text(group.hour)
                                    .padding(.horizontal, 2)
                                    .frame(maxHeight: .infinity)
                                    .background(Color.black.opacity(0.1))
                                
                                VStack {
                                    ForEach(group.items) { item in
                                        VStack {
                                            Spacer()
                                            HStack {
                                                Text(item.time)
                                                    .font(.title)
                                                    .frame(maxWidth: 96, alignment: .leading)
                                                VStack {
                                                    Text(item.type)
                                                        .padding(.vertical, 1)
                                                        .padding(.horizontal, 4)
                                                        .overlay(
                                                            RoundedRectangle(cornerRadius: 4)
                                                                .stroke(Color.black, lineWidth: 1)
                                                        )
                                                        .frame(maxWidth: .infinity, alignment: .leading)
                                                    Text(item.destination)
                                                        .frame(maxWidth: .infinity, alignment: .leading)
                                                }
                                                Spacer()
                                                Image(systemName: "chevron.right")
                                                    .foregroundColor(.gray)
                                            }
                                            Spacer()
                                            Divider()
                                        }
                                    }
                                }
                                .frame(maxHeight: .infinity)
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        // TODO: 戻る処理
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.blue)
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("時刻表")
                        .font(.title)
                }
            }
        }
    }
    // 時刻表のデータを時間ごとにグループ化
    func groupedItems() -> [(hour: String, items: [ScheduleItem])] {
        if selectedTab == 0 {
            Dictionary(grouping: scheduleItems, by: { $0.hour })
                .map { (hour: $0.key, items: $0.value) }
                .sorted { $0.hour < $1.hour }
        }else{
            Dictionary(grouping: holiday, by: { $0.hour })
                .map { (hour: $0.key, items: $0.value) }
                .sorted { $0.hour < $1.hour }
        }
       
    }
}

struct ScheduleItem: Identifiable {
    var id = UUID()
    var hour: String
    var time: String
    var type: String
    var destination: String
}

#Preview {
    TimeTable()
}
