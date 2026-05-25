//
//  WorkExperienceRow.swift
//  JobSearch
//
//  Created by Chaitali Sawant on 29/01/26.
//

import Foundation
import SwiftUI

struct WorkExperienceRow: View {

    let experience: WorkExperienceUIModel

    var body: some View {
        HStack(spacing: 12) {

            Image(systemName: experience.iconName ?? "profile")
                .frame(width: 40, height: 40)
                .background(Color.gray.opacity(0.15))
                .cornerRadius(12)

            VStack(alignment: .leading, spacing: 4) {
                Text(experience.companyName)
                    .font(.subheadline.bold())

                if let duration = experience.duration,
                    let role = experience.role {
                    Text("\(duration)\n\(role)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }

            Spacer()

            Image(systemName: "ellipsis")
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.gray.opacity(0.2))
        )
    }
}
