//
//  ExperienceUIMapper.swift
//  JobSearch
//
//  Created by Chaitali Sawant on 09/02/26.
//

import Foundation

enum ExperienceUIMapper {

    static func map(_ entity: ExperienceEntity) -> WorkExperienceUIModel {

        WorkExperienceUIModel(
            id: entity.id,
            companyName: entity.company,
            role: entity.role,
            duration: formatDuration(
                start: entity.startDate,
                end: entity.endDate
            ),
            iconName: entity.logo,
            description: entity.details
        )
    }

    private static func formatDuration(
        start: Date?,
        end: Date?
    ) -> String {

        let formatter = DateFormatter()
        formatter.dateFormat = "MMM yyyy"

        guard let start else { return "--" }

        let startText = formatter.string(from: start)
        let endText = end != nil
            ? formatter.string(from: end!)
            : "Present"

        return "\(startText) - \(endText)"
    }
}
