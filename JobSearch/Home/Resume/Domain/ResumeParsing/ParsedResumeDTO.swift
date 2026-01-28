//
//  ParsedResumeDTO.swift
//  JobSearch
//
//  Created by Walkar, Karan on 27/01/26.
//

import Foundation

struct ParsedResumeDTO: Codable {
    let name: String?
    let email: String?
    let skills: [String]
    let experiences: [ParsedExperienceDTO]
}

struct ParsedExperienceDTO: Codable {
    let company: String
    let role: String
    let details: String?
}
