//
//  FoundationModelResumeParser.swift
//  JobSearch
//
//  Created by Walkar, Karan on 27/01/26.
//

import Foundation

final class FoundationModelResumeParser {

    func parse(text: String) async throws -> ParsedResumeDTO {
        // Foundation Models call here
        // For now: mock / placeholder
        return ParsedResumeDTO(
            name: "John Doe",
            email: "john@doe.com",
            skills: ["Swift", "SwiftUI"],
            experiences: []
        )
    }
}
