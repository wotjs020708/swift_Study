//
//  Date+Extensions.swift
//  TODOApp
//
//  Created by 어재선 on 5/4/25.
//

import Foundation

extension Date {
    var fromattedDateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "yyyy.MM.dd"
        return dateFormatter.string(from: self)
    }
}
