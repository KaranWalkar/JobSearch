//
//  JobRepositoryImpl.swift
//  JobSearch
//
//  Created by Chaitali Sawant on 28/01/26.
//

import Foundation
import Combine
import SwiftData

final class JobRepositoryImpl: JobRepository {

    private let context: ModelContext

    init(context: ModelContext) {
        self.context = context
    }

    // MARK: - Fetch All Jobs
        func fetchJobs() -> [Job] {
            let descriptor = FetchDescriptor<JobEntity>()
            let entities = (try? context.fetch(descriptor)) ?? []
            return entities.map { $0.toDomain() }
        }

        // MARK: - Fetch Saved Jobs
        func fetchSavedJobs() -> [Job] {
            let predicate = #Predicate<JobEntity> { entity in
                entity.isBookmark == true
            }

            let descriptor = FetchDescriptor<JobEntity>(predicate: predicate)
            let entities = (try? context.fetch(descriptor)) ?? []

            return entities.map { $0.toDomain() }
        }

    // MARK: - Save Jobs (Bulk Insert)
    func saveJobs(_ jobs: [Job]) {
        jobs.forEach { job in
            let entity = JobMapper.toEntity(domain: job)
            context.insert(entity)
        }
    }

    // MARK: - Update Job
        func updateJob(_ job: Job) {

            let jobId = job.id   // ⚠️ required for SwiftData predicate

            let predicate = #Predicate<JobEntity> { entity in
                entity.id == jobId
            }

            let descriptor = FetchDescriptor<JobEntity>(predicate: predicate)

            guard let entity = try? context.fetch(descriptor).first else {
                return
            }

            entity.isBookmark = job.isBookmark
            entity.isApplied = job.isApplied

            try? context.save()
        }

    // MARK: - Toggle Bookmark
    func toggleBookmark(jobId: UUID) {
        let descriptor = FetchDescriptor<JobEntity>(
            predicate: #Predicate { $0.id == jobId }
        )

        guard let entity = try? context.fetch(descriptor).first else { return }
        entity.isBookmark.toggle()
    }

    // MARK: - Mark Job as Applied
    func markAsApplied(jobId: UUID) {
        let descriptor = FetchDescriptor<JobEntity>(
            predicate: #Predicate { $0.id == jobId }
        )

        guard let entity = try? context.fetch(descriptor).first else { return }
        entity.isApplied = true
    }
    
    func seedJobsIfNeeded() {

        let descriptor = FetchDescriptor<JobEntity>()
        let existingCount = (try? context.fetchCount(descriptor)) ?? 0

        guard existingCount == 0 else { return }

        JobFixtures.jobs.forEach { job in
            context.insert(JobEntity(from: job))
        }

        try? context.save()
    }

}
