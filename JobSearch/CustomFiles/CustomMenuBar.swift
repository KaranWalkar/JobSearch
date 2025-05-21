//
//  CustomMenuBar.swift
//  JobSearch
//
//  Created by Walkar, Karan on 19/03/25.
//

import SwiftUI

struct CustomMenuBar: View {
    
    @State private var selectedTab: String = "Home"
    
    var body: some View {
        
        HStack {
            // Home Button
            Button(action: {
                selectedTab = "Home"
            }) {
                HStack {
                    Image(systemName: selectedTab == "Home" ? "house.fill" : "house")
                        .font(.system(size: 24))
                        .foregroundColor(selectedTab == "Home" ? .white : .gray)
                    
//                            if selectedTab == "Home" {
//                                Text("Home")
//                                    .font(.system(size: 18))
//                                    .foregroundColor(selectedTab == "Home" ? .white : .gray)
//                            }
                }
                .padding()
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.small)
            .tint(selectedTab == "Home" ? .gray.opacity(0.1) : .clear)
            
            Spacer()
            
            // Search Button
            Button(action: {
                selectedTab = "Search"
            }) {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 24))
                        .foregroundColor(selectedTab == "Search" ? .white : .gray)
                    
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
            .tint(selectedTab == "Search" ? .gray.opacity(0.1) : .clear)
            
            Spacer()
            
            // Bookmark Button
            Button(action: {
                selectedTab = "Bookmark"
            }) {
                HStack {
                    Image(systemName: selectedTab == "Bookmark" ? "bookmark.fill" : "bookmark")
                        .font(.system(size: 24))
                        .foregroundColor(selectedTab == "Bookmark" ? .white : .gray)
                    
//                            if selectedTab == "Bookmark" {
//                                Text("Bookmark")
//                                    .font(.system(size: 18))
//                                    .foregroundColor(selectedTab == "Bookmark" ? .white : .gray)
//                            }
                }
                .padding()
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.small)
            .tint(selectedTab == "Bookmark" ? .gray.opacity(0.1) : .clear)
            
            Spacer()
            
            // Profile Button
            Button(action: {
                selectedTab = "Profile"
            }) {
                HStack {
                    Image(systemName: selectedTab == "Profile" ? "person.fill" : "person")
                        .font(.system(size: 24))
                        .foregroundColor(selectedTab == "Profile" ? .white : .gray)
                    
//                            if selectedTab == "Profile" {
//                                Text("Profile")
//                                    .font(.system(size: 18))
//                                    .foregroundColor(selectedTab == "Profile" ? .white : .gray)
//                            }
                }
                .padding()
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.small)
            .tint(selectedTab == "Profile" ? .gray.opacity(0.1) : .clear)
        }
    }
}

#Preview {
    CustomMenuBar()
}
