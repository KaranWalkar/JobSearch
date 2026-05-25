//
//  ExperienceEntity.swift
//  JobSearch
//
//  Created by Chaitali Sawant on 09/02/26.
//

import Foundation
import SwiftData
import SwiftData

@Model
final class ExperienceEntity {

    @Attribute(.unique)
    var id: UUID

    var company: String
    var role: String
    var startDate: Date?
    var endDate: Date?
    var details: String?
    var logo: String?

    var profile: ProfileEntity?

    init(
        id: UUID = UUID(),
        company: String,
        role: String,
        startDate: Date? = nil,
        endDate: Date? = nil,
        details: String? = nil,
        logo: String? = nil,
        profile: ProfileEntity? = nil
    ) {
        self.id = id
        self.company = company
        self.role = role
        self.startDate = startDate
        self.endDate = endDate
        self.details = details
        self.logo = logo
        self.profile = profile
    }
}
