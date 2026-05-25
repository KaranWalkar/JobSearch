//
//  JobRepository.swift
//  JobSearch
//
//  Created by Chaitali Sawant on 28/01/26.
//

import Foundation
import Combine

protocol JobRepository {

    // Read
    func fetchJobs() -> [Job]
    func fetchSavedJobs() -> [Job]

    // Write
    func saveJobs(_ jobs: [Job])
    func updateJob(_ job: Job)

    // Actions
    func toggleBookmark(jobId: UUID)
    func markAsApplied(jobId: UUID)
}

