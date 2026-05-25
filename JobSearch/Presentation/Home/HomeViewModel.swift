//
//  HomeViewModel.swift
//  JobSearch
//
//  Created by Chaitali Sawant on 28/01/26.
//

import Foundation
import SwiftUI
import Combine

final class HomeViewModel: ObservableObject {

    @Published var jobs: [JobUIModel] = []
    @Published var currentIndex: Int = 0

    private let fetchJobsUseCase: FetchJobsUseCase
    private var cancellables = Set<AnyCancellable>()

    @Published var profileName: String = "Welcome 👋"
    
    private let profileRepository: ProfileRepository

    init(fetchJobsUseCase: FetchJobsUseCase, profileRepository: ProfileRepository) {
        self.fetchJobsUseCase = fetchJobsUseCase
        self.profileRepository = profileRepository
        loadJobs()
        greetProfileName()
    }
    
    private func greetProfileName() {
        if let profile = profileRepository.fetchProfile() {
            profileName = "Welcome \(profile.name)"
        }
    }
    
    private func loadJobs() {
        fetchJobsUseCase.execute()
            .map { $0.map(JobUIMapper.map) }
            .receive(on: DispatchQueue.main)
            .assign(to: &$jobs)
    }

    func swipeNext() {
        guard !jobs.isEmpty else { return }
        currentIndex = (currentIndex + 1) % jobs.count
    }
    
    func job(by id: UUID) -> JobUIModel? {
        jobs.first { $0.id == id }
    }

}
