//
//  ProfileRepositoryImpl.swift
//  JobSearch
//
//  Created by Chaitali Sawant on 29/01/26.
//

import Foundation
import SwiftData

final class ProfileRepositoryImpl: ProfileRepository {

    private let context: ModelContext

    init(context: ModelContext) {
        self.context = context
    }

    func fetchProfile() -> ProfileEntity? {
        try? context.fetch(FetchDescriptor<ProfileEntity>()).first
    }

    func save(profile newProfile: ProfileEntity) {

        if let existing = fetchProfile() {
            existing.name = newProfile.name
            existing.designation = newProfile.designation
            existing.about = newProfile.about
            existing.skills = newProfile.skills
            existing.cvFileName = newProfile.cvFileName
            existing.cvFileSize = newProfile.cvFileSize
            existing.email = newProfile.email
            existing.phone = newProfile.phone
            existing.linkedin = newProfile.linkedin
            existing.github = newProfile.github
        } else {
            context.insert(newProfile)
        }

        try? context.save()
    }

    func seedIfNeeded() {
        guard fetchProfile() == nil else { return }

        let profile = ProfileEntity(
            name: "John Appleseed",
            designation: "iOS Developer",
            about: "Building scalable SwiftUI apps",
            skills: ["Swift", "SwiftUI", "SwiftData"],
            email: "john@apple.com",
            phone: "+91 9876543210",
            linkedin: "https://linkedin.com/in/johnappleseed",
            github: "https://github.com/johnappleseed"
        )

        context.insert(profile)
        try? context.save()
    }
}

