//
//  JobMapper.swift
//  JobSearch
//
//  Created by Chaitali Sawant on 28/01/26.
//

import Foundation

enum JobMapper {

    static func toDomain(entity: JobEntity) -> Job {
        Job(
            id: entity.id,
            companyName: entity.companyName,
            designation: entity.designation,
            jobType: entity.jobType,
            salary: entity.salary,
            requirement: entity.requirement,
            skill: entity.skill,
            qualification: entity.qualification,
            isBookmark: entity.isBookmark,
            isApplied: entity.isApplied
        )
    }

    static func toEntity(domain: Job) -> JobEntity {
        JobEntity(
            id: domain.id,
            companyName: domain.companyName,
            designation: domain.designation,
            jobType: domain.jobType,
            salary: domain.salary,
            requirement: domain.requirement,
            skill: domain.skill,
            qualification: domain.qualification,
            isBookmark: domain.isBookmark,
            isApplied: domain.isApplied
        )
    }
}

extension JobEntity {

    convenience init(from job: Job) {
        self.init(
            id: job.id,
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

    func toDomain() -> Job {
        Job(
            id: id,
            companyName: companyName,
            designation: designation,
            jobType: jobType,
            salary: salary,
            requirement: requirement,
            skill: skill,
            qualification: qualification,
            isBookmark: isBookmark,
            isApplied: isApplied
        )
    }
}
