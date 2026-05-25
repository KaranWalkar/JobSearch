//
//  ProfileUIModel.swift
//  JobSearch
//
//  Created by Chaitali Sawant on 29/01/26.
//

import Foundation

struct ProfileUIModel: Identifiable, Equatable {

    let id: UUID
    let name: String
    let designation: String?

    let experienceText: String?
    
    let imageName: String
    let about: String
    let cvSize: String
    let experiences: [WorkExperienceUIModel]
    
    let skills: [String]

    let email: String?
    let phone: String?
    let linkedin: String?
    let github: String?
}

/*
struct ProfileUIModel: Identifiable, Equatable {

    let id: UUID

    // MARK: - Header
    let name: String
    let designation: String?
    let experienceText: String
    let imageName: String

    // MARK: - About
    let about: String

    // MARK: - Resume Meta
    let cvSize: String

    // MARK: - Experience
    let experiences: [WorkExperienceUIModel]

    // MARK: - Skills
    let skills: [String]

    // MARK: - Contact
    let email: String?
    let phone: String?
    let linkedin: String?
    let github: String?
}


struct WorkExperienceUIModel: Identifiable, Equatable  {
    let id = UUID()
    let companyName: String
    let role: String
    let duration: String
    let iconName: String
    let descriptions: String?
}
 */

//extension ProfileUIModel {
//    static let mock = ProfileUIModel(
//        name: "Karan Walkar",
//        experienceText: "8+ years of experience",
//        about: "Product designer with a passion for creating user-friendly and visually appealing digital experiences. Skilled in UX/UI and user testing.",
//        cvSize: "2.3 Mb",
//        imageName: "profilePic",
//        experiences: [
//            WorkExperienceUIModel(
//                companyName: "Apple",
//                role: "Middle product designer",
//                duration: "2024 - Present",
//                iconName: "airbnb"
//            ),
//            WorkExperienceUIModel(
//                companyName: "Freelance",
//                role: "Design specialist",
//                duration: "2022 - 2024",
//                iconName: "desktopcomputer"
//            )
//        ]
//    )
//}
