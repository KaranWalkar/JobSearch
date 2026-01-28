//
//  Skill.swift
//  JobSearch
//
//  Created by Walkar, Karan on 27/01/26.
//

import Foundation
//import SwiftData
//
//@Model
//final class Skill {
//
//    @Attribute(.unique)
//    var id: UUID
//
//    var name: String
//    var category: String?
//
//    init(name: String, category: String? = nil) {
//        self.id = UUID()
//        self.name = name
//        self.category = category
//    }
//}


import SwiftData

@Model
final class Skill {
    var name: String

    init(name: String) {
        self.name = name
    }
}
