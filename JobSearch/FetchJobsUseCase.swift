//
//  FetchJobsUseCase.swift
//  JobSearch
//
//  Created by Chaitali Sawant on 28/01/26.
//

import Foundation
import Combine

protocol FetchJobsUseCase {
    func execute() -> AnyPublisher<[Job], Never>
}

final class FetchJobsUseCaseImpl: FetchJobsUseCase {
    private let repository: JobRepository

    init(repository: JobRepository) {
        self.repository = repository
    }

    func execute() -> AnyPublisher<[Job], Never> {
        Just(repository.fetchJobs())
                .eraseToAnyPublisher()
    }
}
