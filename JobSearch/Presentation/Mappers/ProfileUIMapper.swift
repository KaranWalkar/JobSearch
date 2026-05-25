//
//  ProfileUIMapper.swift
//  JobSearch
//
//  Created by Chaitali Sawant on 29/01/26.
//

import Foundation

//enum ProfileUIMapper {
//
//    static func map(entity: ProfileEntity) -> ProfileUIModel {
//        ProfileUIModel(
//            name: entity.name,
//            experienceText: entity.experienceSummary ?? "",
//            about: entity.about ?? "",
//            cvSize: "Uploaded",
//            imageName: "profile_photo",
//            experiences: [] // we’ll fill this later
//        )
//    }
//}

//enum ProfileUIMapper {
//
//    static func map(entity: ProfileEntity) -> ProfileUIModel {
//
//        ProfileUIModel(
//            id: entity.id,
//            name: entity.name,
//            designation: entity.designation,
//            experienceText: entity.experienceSummary?.isEmpty == false ? entity.experienceSummary! : "8+ Years Experience", // derive later
//            imageName: "profile_placeholder",
//            about: entity.about ?? "",
//            cvSize: "1.2 MB", // calculate from file later
//            experiences: [], // parse later
//            skills: entity.skills,
//            email: entity.email,
//            phone: entity.phone,
//            linkedin: entity.linkedin,
//            github: entity.github
//        )
//    }
//}

enum ProfileUIMapper {

    static func map(entity: ProfileEntity) -> ProfileUIModel {
        ProfileUIModel(
            id: entity.id,
            name: entity.name,
            designation: entity.designation,
            experienceText: "8+ Years Experience", // derive later
            imageName: formatBytes(entity.cvFileSize),
            about: "profile_placeholder",
            cvSize: entity.about ?? "",
            experiences: entity.experiences.map(ExperienceUIMapper.map),
            skills: entity.skills,
            email: entity.email,
            phone: entity.phone,
            linkedin: entity.linkedin,
            github: entity.github
        )
    }

    private static func formatBytes(_ bytes: Int64?) -> String {
        guard let bytes else { return "--" }
        let formatter = ByteCountFormatter()
        formatter.countStyle = .file
        return formatter.string(fromByteCount: bytes)
    }
}
