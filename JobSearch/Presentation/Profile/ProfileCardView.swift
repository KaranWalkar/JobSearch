//
//  ProfileCardView.swift
//  JobSearch
//
//  Created by Chaitali Sawant on 29/01/26.
//

import Foundation
import SwiftUI

struct ProfileCardView: View {

    let profile: ProfileUIModel
    let onUploadCV: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {

            ProfileTopRow(profile: profile)

            ProfileActionButtons(
                cvSize: profile.cvSize,
                onUploadCV: onUploadCV
            )

            ProfileAboutSection(text: profile.about)
            
            SkillsView(skills: profile.skills)

            ProfileExperienceSection(experiences: profile.experiences)

        }
        .padding()
        .background(Color.white)
//        .cornerRadius(28)
        .shadow(color: .black.opacity(0.08), radius: 20, y: 10)
//        .padding(.horizontal)
        .mask(RoundedRectangle(cornerRadius: 20, style: .continuous).padding(.bottom, -30))
    }
}


/*
struct ProfileCardView: View {

    let profile: ProfileUIModel
    let onUploadCV: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {

            ProfileTopRow(profile: profile)

            ProfileActionButtons(
                cvSize: profile.cvSize,
                onUploadCV: onUploadCV
            )

            ProfileAboutSection(text: profile.about)

            ProfileExperienceSection(experiences: profile.experiences)

        }
        .padding()
        .background(Color.white)
        .cornerRadius(28)
        .shadow(color: .black.opacity(0.08), radius: 20, y: 10)
        .padding(.horizontal)
    }
}
 */

/*
struct ProfileCardView: View {

    let profile: ProfileUIModel     // ✅ MUST be UI model
    let onUploadCV: () -> Void

    var body: some View {
        VStack(spacing: 24) {

            ProfileInfoRow(profile: profile)

            ProfileActionsRow(
                cvSize: profile.cvSize,
                onUploadCV: onUploadCV,
                onContact: {}
            )

            AboutSection(text: profile.about)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(24)
        .padding()
    }
}
*/

#Preview {
    
    ProfileCardView(
        profile: ProfileView.mockProfile,
        onUploadCV: {
            
        }
    )
}
