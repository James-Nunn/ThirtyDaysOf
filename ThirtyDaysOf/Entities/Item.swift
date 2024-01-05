//
//  Item.swift
//  ThirtyDaysOf
//
//  Created by James Nunn on 3/1/2024.
//

import Foundation
import SwiftData

@Model
final class Challenge {
    var name: String
    var startDate: Date
    var endDate: Date
    
    init(name: String, startDate: Date, endDate: Date) {
        self.name = name
        self.startDate = startDate
        self.endDate = endDate
    }
}

