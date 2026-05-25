//
//  ProfileEntity.swift
//  JobSearch
//
//  Created by Chaitali Sawant on 29/01/26.
//

import Foundation
import SwiftData

@Model
final class ProfileEntity {

    @Attribute(.unique)
    var id: UUID

    var name: String
    var designation: String?
    var about: String?
    var skills: [String]

    @Relationship(deleteRule: .cascade)
    var experiences: [ExperienceEntity] = []
    
    // CV metadata
    var cvFileName: String?
    var cvFileSize: Int64?

    // Contact
    var email: String?
    var phone: String?
    var linkedin: String?
    var github: String?

    init(
        id: UUID = UUID(),
        name: String,
        designation: String? = nil,
        about: String? = nil,
        skills: [String] = [],
        cvFileName: String? = nil,
        cvFileSize: Int64? = nil,
        email: String? = nil,
        phone: String? = nil,
        linkedin: String? = nil,
        github: String? = nil
    ) {
        self.id = id
        self.name = name
        self.designation = designation
        self.about = about
        self.skills = skills
        self.cvFileName = cvFileName
        self.cvFileSize = cvFileSize
        self.email = email
        self.phone = phone
        self.linkedin = linkedin
        self.github = github
    }
}

/*
@Model
final class ProfileEntity {

    @Attribute(.unique)
    var id: UUID

    var name: String
    var designation: String?
    var email: String?
    var phone: String?

    var about: String?
    var skills: [String]
    var subSkills: [String]

    var education: String?
    var experienceSummary: String?
  
    var linkedin: String?
    var github: String?
    
    var cvFileSize: Int64?
    var cvFileName: String?
    
    init(
        id: UUID = UUID(),
        name: String,
        designation: String? = nil,
        email: String? = nil,
        phone: String? = nil,
        about: String? = nil,
        skills: [String] = [],
        subSkills: [String] = [],
        education: String? = nil,
        experienceSummary: String? = nil,
        linkedin: String? = nil,
        github: String? = nil,
        cvFileSize: Int64? = nil,
        cvFileName: String? = nil
    ) {
        self.id = id
        self.name = name
        self.designation = designation
        self.email = email
        self.phone = phone
        self.about = about
        self.skills = skills
        self.subSkills = subSkills
        self.education = education
        self.experienceSummary = experienceSummary
        self.linkedin = linkedin
        self.github = github
        self.cvFileSize = cvFileSize
        self.cvFileName = cvFileName
    }
}
*/
