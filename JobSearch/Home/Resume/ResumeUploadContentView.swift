//
//  ResumeUploadContentView.swift
//  JobSearch
//
//  Created by Walkar, Karan on 27/01/26.
//
import SwiftUI
import SwiftData

struct ResumeUploadContentView: View {

    @StateObject var viewModel: ResumeParserViewModel

    var body: some View {
        VStack(spacing: 16) {

            Button("Upload Resume") {
                // your existing document picker
            }

            if viewModel.isLoading {
                ProgressView("Parsing resume...")
            }

            if let resume = viewModel.resume {
                ResumeDetailView(
                    resume: resume,
                    isEditable: true   // ✅ editable during upload
                )

                Button("Save Resume") {
                    viewModel.save()
                }
            }

            if let error = viewModel.error {
                Text(error)
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
}
