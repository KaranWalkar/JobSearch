//
//  ProfileInfoRow.swift
//  JobSearch
//
//  Created by Chaitali Sawant on 29/01/26.
//

import Foundation
import SwiftUI

struct ProfileTopRow: View {

    let profile: ProfileUIModel

    var body: some View {
        HStack(spacing: 16) {

            Image(profile.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 72, height: 72)
                .clipShape(RoundedRectangle(cornerRadius: 18))

            VStack(alignment: .leading, spacing: 4) {
                Text(profile.name)
                    .font(.headline)
                
                if let designation = profile.designation {
                    Text(designation)
                        .font(.subheadline)
                }
                    
                if let experienceText = profile.experienceText {
                    Text(experienceText)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }

            Spacer()
        }
    }
}

//struct SkillsView: View {
//
//    let skills: [String]
//
//    var body: some View {
//        FlowLayout(skills) { skill in
//            Text(skill)
//                .padding(8)
//                .background(.blue.opacity(0.2))
//                .cornerRadius(12)
//        }
//    }
//}


/*
struct ProfileInfoRow: View {

    let profile: ProfileUIModel

    var body: some View {
        HStack(spacing: 16) {

            Image(profile.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 72, height: 72)
                .clipShape(RoundedRectangle(cornerRadius: 16))

            VStack(alignment: .leading, spacing: 4) {
                Text(profile.name)
                    .font(.headline)

                Text(profile.experienceText)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Spacer()
        }
    }
}

*/

#Preview {
    ProfileTopRow(profile: ProfileView.mockProfile)
}
