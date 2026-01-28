//
//  CustomMenuBar.swift
//  JobSearch
//
//  Created by Walkar, Karan on 19/03/25.
//

import SwiftUI

// MARK: - Tab Enum
enum Tab: CaseIterable {
    case home, search, saved, profile
    
    var title: String {
        switch self {
        case .home: return "Home"
        case .search: return "Search"
        case .saved: return "Saved"
        case .profile: return "Profile"
        }
    }
    
    var iconName: String {
        switch self {
        case .home: return "house.fill"
        case .search: return "magnifyingglass"
        case .saved: return "bookmark.fill"
        case .profile: return "person.fill"
        }
    }
}


struct CustomMenuBar: View {
    
    @State private var selectedTab: Tab = .home
    // Keep a local editable resume to pass as a Binding to ProfileView
    @State private var resume = Resume(
        name: "John Doe",
        email: "johndoe@example.com",
        phone: "+1234567890",
        sections: [],
        rawText: ""
    )

    var body: some View {
            VStack(spacing: 0) {
                // Content area
                ZStack {
                    switch selectedTab {
                    case .home:
                        HomeView()
                    case .search:
                        //                        SearchView()
                        EmptyView()
                    case .saved:
                        EmptyView()
                    case .profile:
                        //                        EmptyView()
                        //                        ProfileView(resume: .constant(Resume(name: "John Doe", email: "johndoe@example.com", phone: "+1234567890", education: ["B.Sc. in Computer Science"], experience: ["Software Developer at XYZ Corp"], skills: ["Swift", "iOS", "Objective-C"])))
                        ProfileView(resume: $resume)
                    }
                }
                // Bottom Menu Bar
                HStack {
                    ForEach(Tab.allCases, id: \.self) { tab in
                        Spacer()
                        Button(action: {
                            selectedTab = tab
                        }) {
                            //                            VStack {
                            //                                Image(systemName: tab.iconName)
                            //                                    .font(.system(size: 20, weight: .bold))
                            //                                    .foregroundColor(selectedTab == tab ? .blue : .gray)
                            //                                Text(tab.title)
                            //                                    .font(.caption)
                            //                                    .foregroundColor(selectedTab == tab ? .blue : .gray)
                            //                            }
                            HStack {
                                Image(systemName: tab.iconName)
                                    .font(.system(size: 24))
                                    .foregroundColor(selectedTab == tab ? .white : .gray)
                                
                                //                            if selectedTab == "Search" {
                                //                                Text("Search")
                                //                                    .font(.system(size: 18))
                                //                                    .foregroundColor(selectedTab == "Search" ? .white : .gray)
                                //                            }
                            }
                            .padding()
                        }
                        .buttonStyle(.borderedProminent)
                        .buttonBorderShape(.capsule)
                        .controlSize(.small)
                        .tint(selectedTab == tab ? .gray.opacity(0.1) : .clear)
                        Spacer()
                    }
                }
                .padding()
                //                .background(Color.white.shadow(radius: 2))
            }
            .edgesIgnoringSafeArea(.bottom)
        }
}

#Preview {
    CustomMenuBar()
}
