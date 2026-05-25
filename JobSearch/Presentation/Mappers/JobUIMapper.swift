//
//  JobUIMapper.swift
//  JobSearch
//
//  Created by Chaitali Sawant on 28/01/26.
//

import Foundation
import SwiftUI

enum JobUIMapper {

    static func map(from job: Job) -> JobUIModel {
        JobUIModel(
            id: job.id,
            logo: Image(systemName: "briefcase.fill"), // placeholder
            companyName: job.companyName,
            designation: job.designation,
            jobType: job.jobType,
            salary: job.salary,
            requirement: job.requirement,
            skill: job.skill,
            qualification: job.qualification,
            isBookmark: job.isBookmark,
            isApplied: job.isApplied
        )
    }
}
