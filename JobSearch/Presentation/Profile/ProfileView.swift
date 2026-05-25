//
//  ProfileView.swift
//  JobSearch
//
//  Created by Chaitali Sawant on 28/01/26.
//

import Foundation
import SwiftUI
import SwiftData

struct ProfileView: View {
    static let mockProfile = ProfileUIModel(
        id: UUID(),
        name: "Karan Walkar",
        designation: "Lead iOS Developer",
        experienceText: "8 years of experience",
        imageName: "profilePic",
        about: "Product designer with a passion for creating user-friendly and visually appealing digital experiences.",
        cvSize: "2.3 Mb",
        experiences: [
            WorkExperienceUIModel(
                id: UUID(),
                companyName: "Apple",
                role: "iOS Developer",
                duration: "2024 – Present",
                iconName: "airplane",
                description: ""
            ),
            WorkExperienceUIModel(
                id: UUID(),
                companyName: "Airbnb1",
                role: "Middle product designer",
                duration: "2024 – Present",
                iconName: "airplane",
                description: ""
            ),
            WorkExperienceUIModel(
                id: UUID(),
                companyName: "Airbnb2",
                role: "Middle product designer",
                duration: "2024 – Present",
                iconName: "airplane",
                description: ""
            ),
            WorkExperienceUIModel(
                id: UUID(),
                companyName: "Freelance",
                role: "Design specialist",
                duration: "2022 – 2024",
                iconName: "desktopcomputer",
                description: ""
            ),
            WorkExperienceUIModel(
                id: UUID(),
                companyName: "Freelance",
                role: "Design specialist",
                duration: "2022 – 2024",
                iconName: "desktopcomputer",
                description: ""
            )
        ],
        skills: ["iOS", "Swift", "SwiftUI", "SwiftData", "Flutter", "AI"],
        email: "karanwalkar@gmail.com",
        phone: "90******22",
        linkedin: "https://www.linkedin.com/in/karanwalkar/",
        github: "https://github.com/KaranWalkar",
        
    )
    
    @Environment(\.modelContext) private var modelContext
    @StateObject private var viewModel = ProfileViewModel()

    @State private var showCVPicker = false

    var body: some View {
        ZStack(alignment: .top) {

            // Background
//            Color(.systemGroupedBackground)
//                .ignoresSafeArea()
            CustomBackground()
            
            VStack(spacing: 0) {
                ProfileHeaderView()
                Spacer()
            }

            ScrollView(showsIndicators: false) {
                VStack(spacing: 16) {
                    ProfileCardView(
                        profile: ProfileView.mockProfile,
                        onUploadCV: { showCVPicker = true }
                    )
                }
                .padding(.top, 80)
            }
        }
        .onAppear {
            viewModel.injectContext(modelContext)
        }
        .sheet(isPresented: $showCVPicker) {
            DocumentPicker { url in
                Task { await viewModel.uploadCV(url: url) }
            }
        }
    }
}


/*
struct ProfileView: View {

    @Environment(\.modelContext) private var modelContext
    @StateObject private var viewModel = ProfileViewModel()
    @State private var showCVPicker = false

    var body: some View {
        VStack {
            ProfileHeaderView()

            ScrollView {
                if let profile = viewModel.profile {
                    ProfileCardView(
                        profile: profile,
                        onUploadCV: { showCVPicker = true }
                    )
                }
            }
        }
        .onAppear {
            viewModel.injectContext(modelContext)
        }
        .sheet(isPresented: $showCVPicker) {
            CVFilePicker { url in
                Task {
                    await viewModel.uploadCV(url: url)
                }
            }
        }
    }
}
*/

/*
struct ProfileView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)

            Text("Your Profile")
                .font(.title)

            Text("Resume • Skills • Preferences")
                .foregroundColor(.secondary)

            Spacer()
        }
        .padding()
    }
}
*/

#Preview {
    ProfileView()
}
