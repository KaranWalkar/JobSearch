//
//  JobFixtures.swift
//  JobSearch
//
//  Created by Chaitali Sawant on 28/01/26.
//

import Foundation

enum JobFixtures {

    static let jobs: [Job] = [
        Job(
            id: UUID(),
            companyName: "Apple",
            designation: "iOS Engineer",
            jobType: "Full-time",
            salary: "$120k – $150k",
            requirement: "Build high-quality SwiftUI apps",
            skill: "Swift, SwiftUI, Combine",
            qualification: "BSc Computer Science",
            isBookmark: false,
            isApplied: false
        ),
        Job(
            id: UUID(),
            companyName: "Google",
            designation: "Mobile Developer",
            jobType: "Hybrid",
            salary: "$130k – $160k",
            requirement: "Work on scalable mobile products",
            skill: "Kotlin, Swift",
            qualification: "BSc or equivalent",
            isBookmark: false,
            isApplied: false
        ),
        Job(
            id: UUID(),
            companyName: "Startup XYZ",
            designation: "SwiftUI Developer",
            jobType: "Remote",
            salary: "$90k – $120k",
            requirement: "Rapid product development",
            skill: "SwiftUI, MVVM",
            qualification: "Experience preferred",
            isBookmark: false,
            isApplied: false
        ),
        Job(
            id: UUID(),
            companyName: "Startup ABC",
            designation: "SwiftUI Developer",
            jobType: "Remote",
            salary: "$90k – $120k",
            requirement: "Rapid product development",
            skill: "SwiftUI, MVVM",
            qualification: "Experience preferred",
            isBookmark: false,
            isApplied: false
        ),
        Job(
            id: UUID(),
            companyName: "Startup DEF",
            designation: "SwiftUI Developer",
            jobType: "Remote",
            salary: "$90k – $120k",
            requirement: "Rapid product development",
            skill: "SwiftUI, MVVM",
            qualification: "Experience preferred",
            isBookmark: false,
            isApplied: false
        )
    ]
}
