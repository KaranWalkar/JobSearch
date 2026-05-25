//
//  RootTabView.swift
//  JobSearch
//
//  Created by Chaitali Sawant on 28/01/26.
//

import Foundation
import SwiftUI

struct RootTabView: View {
    @State private var selectedTab: Tab = .home

    enum Tab {
        case home, search, saved, profile
    }

    var body: some View {
        TabView(selection: $selectedTab) {

            HomeContainerView()
                .tabItem {
                    Label("", systemImage: "house.fill")
                }
                .tag(Tab.home)

            SearchView()
                .tabItem {
                    Label("", systemImage: "magnifyingglass")
                }
                .tag(Tab.search)

            SavedJobsView()
                .tabItem {
                    Label("", systemImage: "bookmark.fill")
                }
                .tag(Tab.saved)

            ProfileView()
                .tabItem {
                    Label("", systemImage: "person.fill")
                }
                .tag(Tab.profile)
        }
    }
}

#Preview {
    RootTabView()
}
