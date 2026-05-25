//
//  ProfileRepository.swift
//  JobSearch
//
//  Created by Chaitali Sawant on 29/01/26.
//

import Foundation

protocol ProfileRepository {
    func fetchProfile() -> ProfileEntity?
    func save(profile: ProfileEntity)
    func seedIfNeeded()
}
