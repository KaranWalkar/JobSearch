//
//  Experience.swift
//  JobSearch
//
//  Created by Walkar, Karan on 27/01/26.
//

import Foundation
//import SwiftData
//
//@Model
//final class Experience {
//
//    @Attribute(.unique)
//    var id: UUID
//
//    var company: String
//    var role: String
//    var startDate: Date?
//    var endDate: Date?
//    var details: String?
//
//    init(
//        company: String,
//        role: String,
//        startDate: Date? = nil,
//        endDate: Date? = nil,
//        details: String? = nil
//    ) {
//        self.id = UUID()
//        self.company = company
//        self.role = role
//        self.startDate = startDate
//        self.endDate = endDate
//        self.details = details
//    }
//}
import SwiftData

@Model
final class Experience {
    var company: String
    var role: String
    var details: String?

    init(company: String, role: String, details: String? = nil) {
        self.company = company
        self.role = role
        self.details = details
    }
}

