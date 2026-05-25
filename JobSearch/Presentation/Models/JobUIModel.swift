//
//  JobUIModel.swift
//  JobSearch
//
//  Created by Chaitali Sawant on 28/01/26.
//

import Foundation
import SwiftUI

struct JobUIModel: Identifiable {
    let id: UUID
    let logo: Image?

    let companyName: String
    let designation: String
    let jobType: String

    let salary: String?
    let requirement: String?
    let skill: String?
    let qualification: String?

    var isBookmark: Bool
    var isApplied: Bool
    
}
