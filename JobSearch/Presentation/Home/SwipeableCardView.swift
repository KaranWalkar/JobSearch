//
//  SwipeableCardView.swift
//  JobSearch
//
//  Created by Chaitali Sawant on 28/01/26.
//

import Foundation
import SwiftUI

struct SwipeableCardView: View {

    let job: JobUIModel
    let onSwiped: () -> Void

    @State private var offset: CGSize = .zero

    var body: some View {
        JobCardView(job: job)
            .offset(offset)
            .gesture(
                DragGesture()
                    .onChanged { offset = $0.translation }
                    .onEnded { value in
                        if abs(value.translation.height) > 150 {
                            onSwiped()
                            offset = .zero
                        } else {
                            offset = .zero
                        }
                    }
            )
            .animation(.spring(), value: offset)
    }
}

#Preview {
    SwipeableCardView(
        job: JobUIModel.preview ,
        onSwiped: {
            print("Card swiped")
        }
    )
    .padding()
}

extension JobUIModel {
    static let preview = JobUIModel(
        id: UUID(), logo: Image("pinterest"), companyName: "OpenAI", designation: "iOS Developer", jobType: "Full Time", salary: "$120k–$150k", requirement: "", skill: "iOS", qualification: "", isBookmark: false, isApplied: false
    )
}
