//
//  ResumeParserViewModel.swift
//  JobSearch
//
//  Created by Walkar, Karan on 24/07/25.
//

import Foundation
import UniformTypeIdentifiers
import SwiftUI
import SwiftData

@MainActor
final class ResumeParserViewModel: ObservableObject {

    @Published var resume: Resume?
    @Published var isLoading = false
    @Published var error: String?

    private let parser = FoundationModelResumeParser()
    private let context: ModelContext

    init(context: ModelContext) {
        self.context = context
    }

    func parseResume(text: String) {
        isLoading = true

        Task {
            do {
                let parsed = try await parser.parse(text: text)

                let resume = Resume(rawText: text)
                resume.name = parsed.name
                resume.email = parsed.email
                resume.skills = parsed.skills.map { Skill(name: $0) }
                resume.experiences = parsed.experiences.map {
                    Experience(company: $0.company, role: $0.role, details: $0.details)
                }

                context.insert(resume)
                self.resume = resume
                isLoading = false
            } catch {
                self.error = error.localizedDescription
                isLoading = false
            }
        }
    }
}


//class ResumeParserViewModel: ObservableObject {
//    @Published var resume: Resume = Resume()
//    @Published var selectedFileText: String = ""
//    
//    func parseText(_ text: String) {
//        var parsedResume = Resume()
//        print("Text: \(text)")
//        selectedFileText = text
//        
////        parsedResume.name = ResumeParser.extractName(from: text)
////        parsedResume.email = ResumeParser.extractEmail(from: text)
////        parsedResume.phone = ResumeParser.extractPhone(from: text)
////        parsedResume.education = ResumeParser.extractEducation(from: text)
////        parsedResume.experience = ResumeParser.extractExperience(from: text)
////        parsedResume.skills = ResumeParser.extractSkills(from: text)
//        
//        self.resume = parsedResume
//        print("Parsed Text: \(self.resume)")
//    }
//}

