//
//  Item.swift
//  JobSearch
//
//  Created by Walkar, Karan on 17/03/25.
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
