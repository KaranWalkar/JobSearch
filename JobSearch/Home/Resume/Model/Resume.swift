//
//  Resume.swift
//  JobSearch
//
//  Created by Walkar, Karan on 24/07/25.
//


import Foundation
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


//import SwiftData
//
//@Model
//final class Resume {
//
//    @Attribute(.unique)
//    var id: UUID
//
//    // Raw source
//    var rawText: String
//    var parsedAt: Date
//
//    // Personal info
//    var name: String?
//    var email: String?
//    var phone: String?
//    var summary: String?
//    var totalExperienceYears: Double?
//
//    // Relationships
//    @Relationship(deleteRule: .cascade)
//    var skills: [Skill]
//
//    @Relationship(deleteRule: .cascade)
//    var experiences: [Experience]
//
//    init(rawText: String) {
//        self.id = UUID()
//        self.rawText = rawText
//        self.parsedAt = .now
//        self.skills = []
//        self.experiences = []
//    }
//}



/*
@Model
class Resume {
    var name: String
    var email: String
    var phone: String
    var sections: [ResumeSection]
    var rawText: String
    var createdAt: Date

    init(
        name: String = "",
        email: String = "",
        phone: String = "",
        sections: [ResumeSection] = [],
        rawText: String = ""
    ) {
        self.name = name
        self.email = email
        self.phone = phone
        self.sections = sections
        self.rawText = rawText
        self.createdAt = .now
    }
}

@Model
class ResumeSection {
    var title: String
    var subSections: [ResumeSubSection]   // ✅ multiple optional
    var createdAt: Date

    init(title: String, subSections: [ResumeSubSection] = []) {
        self.title = title
        self.subSections = subSections
        self.createdAt = .now
    }
}

@Model
class ResumeSubSection {
    var heading: String        // optional heading/title
    var content: String        // description/body
    var createdAt: Date

    init(heading: String = "", content: String = "") {
        self.heading = heading
        self.content = content
        self.createdAt = .now
    }
}
*/
/*
@Model
class Resume {
    var id: UUID
    var name: String
    var email: String
    var phone: String
    var education: [String]
    var experience: [String]
    var skills: [String]

    init(
        id: UUID = UUID(),
        name: String = "",
        email: String = "",
        phone: String = "",
        education: [String] = [],
        experience: [String] = [],
        skills: [String] = []
    ) {
        self.id = id
        self.name = name
        self.email = email
        self.phone = phone
        self.education = education
        self.experience = experience
        self.skills = skills
    }
}
*/
