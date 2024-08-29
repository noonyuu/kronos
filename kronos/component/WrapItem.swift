//
//  WrapItem.swift
//  kronos
//
//  Created by shimizu on 2024/08/29.
//

import SwiftUI

struct Types: Identifiable {
    var id = UUID()
    var name: String
    var isChecked: Bool = false
}

struct WrapItem: View {
    @Binding var persons: [Types]

    var body: some View {
        GeometryReader { geometry in
            self.generateContent(in: geometry)
        }
        .frame(maxHeight: 100)
        .onAppear {
            removeDuplicates()
        }
    }

    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero

        return ZStack(alignment: .topLeading) {
            ForEach(Array(persons.enumerated()), id: \.element.id) { index, person in
                self.item(for: person)
                    .padding([.horizontal, .vertical], 4)
                    .alignmentGuide(.leading, computeValue: { d in
                        if abs(width - d.width) > g.size.width {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if person.name == persons.last!.name {
                            width = 0 // last item
                        } else {
                            width -= d.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: { d in
                        let result = height
                        if person.name == persons.last!.name {
                            height = 0 // last item
                        }
                        return result
                    })
                    .onTapGesture {
                        self.persons[index].isChecked.toggle()
                    }
            }
        }
        .padding(.leading,8)
    }

    func item(for person: Types) -> some View {
        HStack(spacing: 0) {
            Image(systemName: person.isChecked ? "checkmark.circle.fill" : "checkmark.circle")
                .foregroundColor(person.isChecked ? .blue : .gray)
            
            Text("\(person.name)")
                .padding(.all, 4)
                .font(.body)
        }
        .padding(.horizontal, 2)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.gray, lineWidth: 1)
        )
    }
    
    // 重複を排除する関数
    private func removeDuplicates() {
        persons = Array(
            Dictionary(grouping: persons, by: { $0.name })
                .compactMap { $0.value.first }
        )
    }
}
