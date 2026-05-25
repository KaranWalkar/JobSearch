//
//  AppContainer.swift
//  JobSearch
//
//  Created by Chaitali Sawant on 28/01/26.
//

import Foundation
import SwiftData

final class AppContainer {

    static let shared = AppContainer()

    let modelContainer: ModelContainer
    let jobRepository: JobRepository
    let profileRepository: ProfileRepository

    let fetchJobsUseCase: FetchJobsUseCase

    private let jobRepositoryImpl: JobRepositoryImpl
    private let profileRepositoryImpl: ProfileRepositoryImpl

    private init() {

        modelContainer = try! ModelContainer(
            for: JobEntity.self,
            ProfileEntity.self
        )
        
        let context = ModelContext(modelContainer)

        jobRepositoryImpl = JobRepositoryImpl(context: context)
        profileRepositoryImpl = ProfileRepositoryImpl(context: context)

        jobRepository = jobRepositoryImpl
        profileRepository = profileRepositoryImpl


        fetchJobsUseCase = FetchJobsUseCaseImpl(repository: jobRepository)
    }

    func seedInitialDataIfNeeded() {
        jobRepositoryImpl.seedJobsIfNeeded()
        profileRepositoryImpl.seedIfNeeded()
    }
}
