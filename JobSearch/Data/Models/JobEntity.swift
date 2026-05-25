//
//  JobEntity.swift
//  JobSearch
//
//  Created by Chaitali Sawant on 28/01/26.
//

import Foundation
import SwiftData

@Model
final class JobEntity {
    
    @Attribute(.unique)
    var id: UUID

    var companyName: String
    var designation: String
    var jobType: String

    var salary: String?
    var requirement: String?
    var skill: String?
    var qualification: String?

    var isBookmark: Bool
    var isApplied: Bool

    init(
        id: UUID,
        companyName: String,
        designation: String,
        jobType: String,
        salary: String?,
        requirement: String?,
        skill: String?,
        qualification: String?,
        isBookmark: Bool,
        isApplied: Bool
    ) {
        self.id = id
        self.companyName = companyName
        self.designation = designation
        self.jobType = jobType
        self.salary = salary
        self.requirement = requirement
        self.skill = skill
        self.qualification = qualification
        self.isBookmark = isBookmark
        self.isApplied = isApplied
    }
}
