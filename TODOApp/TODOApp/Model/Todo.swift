//
//  Item.swift
//  TODOApp
//
//  Created by 어재선 on 4/13/25.
//

import Foundation
import SwiftData

@Model
final class Todo {
    @Attribute(.unique)
    var id: UUID
    var title: String
    var startDate: Date
    var endDate: Date?
    var note: String?
    var status: TodoStatus.RawValue
    
    init(id: UUID = UUID(), title: String, startDate: Date, endDate: Date? = nil, note: String? = nil, status: TodoStatus = .todo) {
        self.id = id
        self.title = title
        self.startDate = startDate
        self.endDate = endDate
        self.note = note
        self.status = status.rawValue
    }
    
    
}
