//
//  ProfileViewModel.swift
//  JobSearch
//
//  Created by Chaitali Sawant on 29/01/26.
//

import Foundation
import SwiftData

@MainActor
final class ProfileViewModel: ObservableObject {

    @Published var profile: ProfileUIModel?
    @Published var showContactSheet = false

    private var repository: ProfileRepository?
    private let extractor = ResumeTextExtractor()
    private let parser = ResumeParser()

    func injectContext(_ context: ModelContext) {
        repository = ProfileRepositoryImpl(context: context)
        repository?.seedIfNeeded()
        reload()
    }

    func reload() {
        if let entity = repository?.fetchProfile() {
            profile = ProfileUIMapper.map(entity: entity)
        }
    }

    func uploadCV(url: URL) async {
        guard let repository else { return }

        do {
            let attrs = try FileManager.default.attributesOfItem(atPath: url.path)
            let fileSize = attrs[.size] as? Int64

            let text = try await extractor.extractText(from: url)
            let parsed = parser.parse(text: text)

            let entity = ProfileEntity(
                name: parsed.name,
                designation: parsed.designation,
                about: parsed.about,
                skills: parsed.skills,
                cvFileName: url.lastPathComponent,
                cvFileSize: fileSize,
                email: parsed.email,
                phone: parsed.phone,
                linkedin: parsed.linkedin,
                github: parsed.github
            )

            repository.save(profile: entity)
            reload()

        } catch {
            print("Resume parsing failed:", error)
        }
    }
}
