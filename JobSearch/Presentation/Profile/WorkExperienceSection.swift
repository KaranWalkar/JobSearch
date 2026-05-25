//
//  WorkExperienceSection.swift
//  JobSearch
//
//  Created by Chaitali Sawant on 29/01/26.
//

import Foundation
import SwiftUI

struct ProfileExperienceSection: View {

    let experiences: [WorkExperienceUIModel]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {

            Text("Work experience")
                .font(.headline)

            ForEach(experiences) { exp in
                HStack(spacing: 12) {

                    Image(systemName: exp.iconName ?? "profile")
                        .frame(width: 44, height: 44)
                        .background(Color.gray.opacity(0.15))
                        .cornerRadius(14)

                    VStack(alignment: .leading, spacing: 4) {
                        Text(exp.companyName)
                            .font(.subheadline.bold())

                        Text(exp.role ?? "")
                            .font(.caption)
                            .foregroundColor(.secondary)

                        Text(exp.duration ?? "")
                            .font(.caption2)
                            .foregroundColor(.secondary)
                    }

                    Spacer()

                    Image(systemName: "ellipsis")
                        .foregroundColor(.gray)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 18)
                        .stroke(Color.gray.opacity(0.2))
                )
            }
        }
    }
}


//struct WorkExperienceSection: View {
//
//    let experiences: [WorkExperienceUIModel]
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 12) {
//
//            Text("Work experience")
//                .font(.headline)
//
//            ForEach(experiences) { experience in
//                WorkExperienceRow(experience: experience)
//            }
//        }
//    }
//}

