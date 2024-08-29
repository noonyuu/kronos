//
//  TableViewPopUp.swift
//  kronos
//
//  Created by shimizu on 2024/08/30.
//

import SwiftUI

struct TableViewPopUp: View {
    @Binding var isVisible: Bool
    @Binding var items: [ScheduleItem]
    @State private var selectionDate = Date()
    @State var pickerIndex = 0
    @State private var selectedMonth = 0
    @State private var selectedDay = 0
    
    @State private var selectedItems: Set<UUID> = []
    @State var persons: [Types] = [
        Types(name: "Grace"),
        Types(name: "普通"),
        Types(name: "特急"),
        Types(name: "準急"),
        Types(name: "普通"),
        Types(name: "Frank"),
        Types(name: "Grace"),
        Types(name: "Hank")
    ]
    let months = Calendar.current.monthSymbols
    
    var currentYear: Int {
        Calendar.current.component(.year, from: Date())
    }
    
    var daysInMonth: [Int] {
        // 月ごとに日数を取得
        let calendar = Calendar.current
        let month = selectedMonth + 1
        let dateComponents = DateComponents(year: currentYear, month: month)
        let date = calendar.date(from: dateComponents)!
        let range = calendar.range(of: .day, in: .month, for: date)!
        return Array(range)
    }
    var body: some View {
        VStack {
            Button(action:{
                isVisible.toggle()
            }){
                Image(systemName: "xmark")
                    .foregroundColor(.blue)
                    .frame(maxWidth: .infinity,alignment: .topLeading)
            }
            .padding(.leading, 16)
            HStack {
                Text("時間")
                    .foregroundColor(.gray)
                    .fontWeight(.bold)
                    .font(.title3)
                    .frame(width: 80)
                    .padding(.vertical)
                Picker("時間", selection: $pickerIndex) {
                    ForEach(0..<groupedItems().count, id: \.self) { index in
                        Text(groupedItems()[index].hour)
                    }
                }
                .pickerStyle(.wheel)
                .frame(width: 100,height: 100)
                .padding(.leading, 8)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 8)
            Divider()
            HStack() {
                Text("日付")
                    .foregroundColor(.gray)
                    .fontWeight(.bold)
                    .font(.title3)
                    .frame(width: 80)
                    .padding(.vertical)
                // 月のpicker
                ZStack {
                    // Optional:
                    // RoundedRectangle(cornerRadius: 16)
                    //     .fill(Color.gray.opacity(0.8))
                    //     .frame(width: 100, height: 32)
                    
                    Picker("Month", selection: $selectedMonth) {
                        ForEach(0..<months.count, id: \.self) { index in
                            Text(self.months[index]).tag(index)
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(width: 100, height: 100)
                }
                .clipped()
                .onChange(of: selectedMonth) { _ in
                    adjustDaySelection()
                }
                
                // 曜日のpicker
                ZStack {
                    // Optional:
                    // RoundedRectangle(cornerRadius: 16)
                    //     .fill(Color.gray.opacity(0.8))
                    //     .frame(width: 50, height: 32)
                    
                    Picker("Day", selection: $selectedDay) {
                        ForEach(daysInMonth, id: \.self) { day in
                            Text("\(day)").tag(day - 1)
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(width: 50, height: 100)
                    .background(Color.clear)
                }
                .clipped()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 8)
            Divider()
            // 行先
            VStack(alignment: .center) {
                Text("行先")
                    .foregroundColor(.gray)
                    .fontWeight(.bold)
                    .font(.title3)
                    .frame(maxWidth: .infinity, alignment:.leading)
                    .padding(.leading, 16)
                WrapItem(persons: $persons)
                    .frame(maxWidth: .infinity)
            }
            .frame(maxHeight: 150, alignment: .center)
            .padding(.leading, 10)
            Divider()
            HStack {
                VStack {
                    Text("種別")
                        .foregroundColor(.gray)
                        .fontWeight(.bold)
                        .font(.title3)
                        .frame(maxWidth: .infinity, alignment:.leading)
                        .padding(.leading, 16)
                    
                    VStack {
                        ForEach(items) { item in
                            HStack {
                                Button(action: {
                                    toggleSelection(for: item.id)
                                }) {
                                    Image(systemName: selectedItems.contains(item.id) ? "checkmark.circle.fill" : "checkmark.circle")
                                        .foregroundColor(selectedItems.contains(item.id) ? .blue : .gray)
                                }
                                Text("\(item.destination)")
                            }
                            .frame(maxWidth: .infinity, alignment:.leading)
                            .padding(.leading)
                        }
                    }
                    .frame(maxHeight: 150, alignment: .topLeading)
                }
                .frame(height: 150)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 8)
            Button("絞り込む") {
                // 選択した時間
                print(groupedItems()[pickerIndex].hour)
                
                //            Text("Selected Date: \(months[selectedMonth]) \(daysInMonth[selectedDay])")
                //                .font(.title)
                //                .padding()
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .fontWeight(.bold)
            .font(.title2).padding(.horizontal)
            .cornerRadius(150)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 24)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 20)
        .onAppear {
            removeDuplicates()
        }
    }
    
    private func adjustDaySelection() {
        let maxDays = daysInMonth.count
        if selectedDay >= maxDays {
            selectedDay = maxDays - 1
        }
    }
    
    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d"
        return formatter.string(from: date)
    }
    
    func groupedItems() -> [(hour: String, items: [ScheduleItem])] {
        Dictionary(grouping: items, by: { $0.hour })
            .map { (hour: $0.key, items: $0.value) }
            .sorted { $0.hour < $1.hour }
    }
    // 重複を排除する関数
    private func removeDuplicates() {
        items = Array(
            Dictionary(grouping: items, by: { $0.destination })
                .compactMap { $0.value.first }
        )
    }
    private func toggleSelection(for id: UUID) {
        if selectedItems.contains(id) {
            selectedItems.remove(id)
        } else {
            selectedItems.insert(id)
        }
    }
}

