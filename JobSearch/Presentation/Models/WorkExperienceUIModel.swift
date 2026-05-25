//
//  WorkExperienceUIModel.swift
//  JobSearch
//
//  Created by Chaitali Sawant on 09/02/26.
//

import Foundation

struct WorkExperienceUIModel: Identifiable, Equatable {

    let id: UUID
    let companyName: String
    let role: String?
    let duration: String?
    let iconName: String?
    let description: String?
    
}
