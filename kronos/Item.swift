//
//  Item.swift
//  kronos
//
//  Created by shimizu on 2024/08/20.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
