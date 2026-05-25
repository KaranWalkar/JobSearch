//
//  HomeContainerView.swift
//  JobSearch
//
//  Created by Chaitali Sawant on 28/01/26.
//

import Foundation
import SwiftUI
import SwiftData

struct HomeContainerView: View {

    @StateObject private var navigationState = AppNavigationState()
    @Environment(\.modelContext) private var modelContext
    
    @StateObject private var viewModel =
        HomeViewModel(
            fetchJobsUseCase: AppContainer.shared.fetchJobsUseCase, profileRepository: AppContainer.shared.profileRepository
        )

    var body: some View {
        NavigationStack(path: $navigationState.path) {
            ZStack {
                CustomBackground()
                HomeView(
                    viewModel: viewModel,
                    navigationState: navigationState
                )
            }
            .navigationDestination(for: AppRoute.self) { route in
                destinationView(for: route)
            }
        }
    }

    @ViewBuilder
    private func destinationView(for route: AppRoute) -> some View {
        switch route {
        case .jobDetail(let jobId):
            if let job = viewModel.job(by: jobId) {
//                JobDetailView(job: job)
                DetailsView(jobObj: job)
            } else {
                Text("Job not found")
            }
        }
    }
}

#Preview {
    HomeContainerView()
}
