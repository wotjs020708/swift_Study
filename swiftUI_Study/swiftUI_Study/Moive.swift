//
//  Moive.swift
//  swiftUI_Study
//
//  Created by 어재선 on 9/26/24.
//

import Foundation
import SwiftUI

class Movie: Codable {
    var title: String?
    var genreName: String?
    var thumbnailImage: String?
    var linkURL: String?
    var ratingAverage: Double?
    
    enum CodingKeys: String, CodingKey {
        case title
        case genreName
        case thumbnailImage
        case linkURL
        case ratingAverage
    }
}

