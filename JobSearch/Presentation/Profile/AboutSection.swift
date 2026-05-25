//
//  AboutSection.swift
//  JobSearch
//
//  Created by Chaitali Sawant on 29/01/26.
//

import Foundation
import SwiftUI

struct ProfileAboutSection: View {

    let text: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("About")
                .font(.headline)

            Text(text)
                .font(.body)
                .foregroundColor(.secondary)
        }
    }
}


//struct AboutSection: View {
//
//    let text: String
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 8) {
//            Text("About")
//                .font(.headline)
//
//            Text(text)
//                .font(.body)
//                .foregroundColor(.secondary)
//        }
//    }
//}

