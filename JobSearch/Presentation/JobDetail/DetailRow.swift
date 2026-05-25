//
//  DetailRow.swift
//  JobSearch
//
//  Created by Chaitali Sawant on 28/01/26.
//

import Foundation
import SwiftUI

struct DetailRow: View {

    let title: String
    let value: String?

    var body: some View {
        HStack(alignment: .top, spacing: 8) {

            Text(title)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .frame(width: 100, alignment: .leading)

            Text(value ?? "Not specified")
                .font(.subheadline)
                .foregroundColor(.primary)

            Spacer()
        }
    }
}
