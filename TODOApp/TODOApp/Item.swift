//
//  Item.swift
//  TODOApp
//
//  Created by 어재선 on 4/13/25.
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
