//
//  ParsedResumeDTO.swift
//  JobSearch
//
//  Created by Walkar, Karan on 27/01/26.
//

import Foundation

struct ParsedResume {
    let name: String
    let designation: String?
    let email: String?
    let phone: String?
    let skills: [String]
    let about: String
    let linkedin: String?
    let github: String?
}

/*
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
*/
