//
//  Resume.swift
//  JobSearch
//
//  Created by Chaitali Sawant on 28/01/26.
//

import Foundation
struct Resume {
    let name: String
    let skills: [String]
    let experience: Int
    let education: String
}

/*
 import SwiftData

 @Model
 final class Resume {

     var rawText: String
     var parsedAt: Date

     var name: String?
     var email: String?
     var phone: String?

     @Relationship(deleteRule: .cascade)
     var skills: [Skill]

     @Relationship(deleteRule: .cascade)
     var experiences: [Experience]

     init(rawText: String) {
         self.rawText = rawText
         self.parsedAt = .now
         self.skills = []
         self.experiences = []
     }
 }
 */
