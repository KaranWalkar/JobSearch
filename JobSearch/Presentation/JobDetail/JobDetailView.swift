//
//  JobDetailView.swift
//  JobSearch
//
//  Created by Chaitali Sawant on 28/01/26.
//

import Foundation
import SwiftUI

struct JobDetailView: View {
    let job: JobUIModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {

                HStack {
                    job.logo?
                        .resizable()
                        .frame(width: 50, height: 50)

                    VStack(alignment: .leading) {
                        Text(job.companyName)
                            .font(.headline)
                        Text(job.designation)
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                }

                DetailRow(title: "Job Type", value: job.jobType)
                DetailRow(title: "Salary", value: job.salary)
                DetailRow(title: "Skills", value: job.skill)
                DetailRow(title: "Qualification", value: job.qualification)

                Text("Requirements")
                    .font(.headline)

                Text(job.requirement ?? "Not specified")
                    .foregroundColor(.secondary)

                Spacer()

                Button {
                    // Apply logic later
                } label: {
                    Text(job.isApplied ? "Applied" : "Apply Now")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(job.isApplied ? .gray : .black)
                        .foregroundColor(.white)
                        .cornerRadius(14)
                }
            }
            .padding()
        }
        .navigationTitle("Job Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    JobDetailView(job: JobUIModel.preview)
}
