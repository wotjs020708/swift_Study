//
//  Item.swift
//  TODOApp
//
//  Created by 어재선 on 4/13/25.
//

import Foundation
import SwiftData

@Model
final class Todo\ {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
