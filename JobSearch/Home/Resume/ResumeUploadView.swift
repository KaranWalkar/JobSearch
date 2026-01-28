//
//  ResumeUploadView.swift
//  JobSearch
//
//  Created by Walkar, Karan on 24/07/25.
//

import SwiftUI
import SwiftData

struct ResumeUploadView: View {

    @Environment(\.modelContext) private var modelContext

    var body: some View {
        ResumeUploadContentView(
            viewModel: ResumeParserViewModel(context: modelContext)
        )
    }
}


/*
import SwiftUI
import SwiftData

struct ResumeUploadView: View {

    @Environment(\.modelContext) private var context

    @State private var showPicker = false
    @State private var resume: Resume?
    @State private var isEditing = false
    @State private var newSectionTitle = ""

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {

                // MARK: Upload Button
                Button {
                    showPicker = true
                } label: {
                    Label("Upload Resume", systemImage: "doc.fill")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue.opacity(0.15))
                        .cornerRadius(12)
                }

                // MARK: Edit Toggle
                if resume != nil {
                    Toggle("Edit Mode", isOn: $isEditing)
                        .toggleStyle(SwitchToggleStyle())
                }

                if let resume {
                    contactSection(resume)
                    sectionList(resume)
                    addSectionView(resume)
                }
            }
            .padding()
        }
        .sheet(isPresented: $showPicker) {
            ResumeDocumentPicker { url in
                handleImport(url)
            }
        }
    }

    // MARK: - Contact Info
    private func contactSection(_ resume: Resume) -> some View {
        VStack(alignment: .leading, spacing: 12) {

            Text("Contact Information")
                .font(.headline)

            editableTextField("Full Name", text: binding(resume, \.name))
            editableTextField("Email", text: binding(resume, \.email))
            editableTextField("Phone", text: binding(resume, \.phone))
        }
    }

    // MARK: - Dynamic Sections
    private func sectionList(_ resume: Resume) -> some View {
        VStack(spacing: 24) {

            ForEach(resume.sections) { section in
                VStack(alignment: .leading, spacing: 12) {

                    // Section Title
                    HStack {
                        Text(section.title)
                            .font(.headline)

                        Spacer()

                        if isEditing {
                            Button(role: .destructive) {
                                deleteSection(section, from: resume)
                            } label: {
                                Image(systemName: "trash")
                            }
                        }
                    }

                    // SubSections
                    ForEach(section.subSections) { sub in
                        VStack(alignment: .leading, spacing: 6) {

                            // Optional heading
                            if isEditing || !sub.heading.isEmpty {
                                TextField(
                                    "Sub-section heading (optional)",
                                    text: Binding(
                                        get: { sub.heading },
                                        set: { sub.heading = $0 }
                                    )
                                )
                                .font(.subheadline)
                                .disabled(!isEditing)
                            }

                            // Content
                            TextEditor(
                                text: Binding(
                                    get: { sub.content },
                                    set: { sub.content = $0 }
                                )
                            )
                            .frame(minHeight: 100)
                            .disabled(!isEditing)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray.opacity(0.3))
                            )

                            if isEditing {
                                Button(role: .destructive) {
                                    deleteSubSection(sub, from: section)
                                } label: {
                                    Label("Delete Entry", systemImage: "trash")
                                }
                            }
                        }
                    }

                    // Add SubSection
                    if isEditing {
                        Button("Add Entry") {
                            addSubSection(to: section)
                        }
                    }
                }
            }
        }
    }


    // MARK: - Add New Section
    private func addSectionView(_ resume: Resume) -> some View {
        Group {
            if isEditing {
                VStack(alignment: .leading, spacing: 10) {

                    Text("Add Section")
                        .font(.headline)

                    TextField("Section Title", text: $newSectionTitle)
                        .textFieldStyle(.roundedBorder)

                    Button("Add Section") {
                        addSection(to: resume)
                    }
                    .disabled(newSectionTitle.trimmingCharacters(in: .whitespaces).isEmpty)
                }
            }
        }
    }

    // MARK: - Import Logic
    private func handleImport(_ url: URL) {

        let extractedText: String

        switch url.pathExtension.lowercased() {
        case "pdf":
            extractedText = PDFExtractor.extract(from: url)
        case "docx":
//            extractedText = DOCXExtractor.extract(from: url)
            extractedText = ""

        default:
            extractedText = ""
        }

        guard !extractedText.isEmpty else { return }

        let parsedResume = IntelligentResumeParser.parse(text: extractedText)
        context.insert(parsedResume)
        resume = parsedResume
        isEditing = false
    }

    // MARK: - CRUD Helpers
    private func delete(_ section: ResumeSection, from resume: Resume) {
        resume.sections.removeAll { $0.id == section.id }
        context.delete(section)
    }

    private func addSection(to resume: Resume) {

        let section = ResumeSection(
            title: newSectionTitle,
            subSections: [
                ResumeSubSection(
                    heading: "",
                    content: ""
                )
            ]
        )

        resume.sections.append(section)
        context.insert(section)

        newSectionTitle = ""
    }

    
    private func addSubSection(to section: ResumeSection) {
        let sub = ResumeSubSection()
        section.subSections.append(sub)
        context.insert(sub)
    }

    private func deleteSubSection(_ sub: ResumeSubSection, from section: ResumeSection) {
        section.subSections.removeAll { $0.id == sub.id }
        context.delete(sub)
    }

    private func deleteSection(_ section: ResumeSection, from resume: Resume) {
        resume.sections.removeAll { $0.id == section.id }
        section.subSections.forEach { context.delete($0) }
        context.delete(section)
    }


    // MARK: - Editable TextField Wrapper
    private func editableTextField(_ title: String, text: Binding<String>) -> some View {
        TextField(title, text: text)
            .textFieldStyle(.roundedBorder)
            .disabled(!isEditing) // ⛔ keyboard disabled
    }

    // MARK: - SwiftData Binding
    private func binding<Value>(
        _ resume: Resume,
        _ keyPath: ReferenceWritableKeyPath<Resume, Value>
    ) -> Binding<Value> {
        Binding(
            get: { resume[keyPath: keyPath] },
            set: { resume[keyPath: keyPath] = $0 }
        )
    }
}

*/

/*
import SwiftUI
import SwiftData

struct ResumeUploadView: View {
    @Environment(\.modelContext) private var context
    @State private var showPicker = false

    var body: some View {
        Button("Import Resume") {
            showPicker = true
        }
        .sheet(isPresented: $showPicker) {
            ResumeDocumentPicker { url in
                let text = url.pathExtension.lowercased() == "pdf"
                    ? PDFExtractor.extract(from: url)
                    : ""//DOCXExtractor.extract(from: url)

                let resume = IntelligentResumeParser.parse(text: text)
                context.insert(resume)
            }
        }
    }
}
*/

/*
import UniformTypeIdentifiers
import PDFKit

struct ResumeUploadView: View {
    @StateObject private var viewModel = ResumeParserViewModel()
    @State private var isFileImporterPresented = false

    var body: some View {
        NavigationView {
            HStack {
                VStack(alignment: .leading, spacing: 20) {
                    Button("Upload Resume") {
                        isFileImporterPresented = true
                    }
                    .fileImporter(
                        isPresented: $isFileImporterPresented,
                        allowedContentTypes: [.pdf, .plainText, .rtf, .init(filenameExtension: "docx")!],
                        allowsMultipleSelection: false
                    ) { result in
                        handleFileSelection(result)
                    }
                    
                    if !viewModel.resume.name.isEmpty {
                        NavigationLink("Edit Resume") {
                            ResumeDetailView(resume: $viewModel.resume, isEditable: true) // Pass the resume as Binding
                        }
                    } else {
                        Text("No resume parsed yet.")
                            .foregroundColor(.gray)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .border(.red)
                //            .navigationTitle("Resume Parser")
                Spacer()
            }
        }
        .frame(height: 100)
        .cornerRadius(10)
        .shadow(radius: 5)
        
    }
    
//    var body: some View {
//        NavigationView {
//            VStack(spacing: 24) {
//                VStack(alignment: .leading, spacing: 12) {
//                    Text("Upload Your Resume")
//                        .font(.title2)
//                        .fontWeight(.semibold)
//                    
//                    Button(action: {
//                        isFileImporterPresented = true
//                    }) {
//                        Label("Choose Resume", systemImage: "doc.fill")
//                            .font(.headline)
//                            .padding()
//                            .frame(maxWidth: .infinity)
//                            .background(Color.accentColor)
//                            .foregroundColor(.white)
//                            .cornerRadius(10)
//                    }
//                    .fileImporter(
//                        isPresented: $isFileImporterPresented,
//                        allowedContentTypes: [.pdf, .plainText, .rtf, .init(filenameExtension: "docx")!],
//                        allowsMultipleSelection: false
//                    ) { result in
//                        handleFileSelection(result)
//                    }
//                    
//                    if !viewModel.resume.name.isEmpty {
//                        Text("Selected: \(viewModel.resume.name)")
//                            .font(.subheadline)
//                            .foregroundColor(.secondary)
//                            .lineLimit(1)
//                            .truncationMode(.middle)
//                    }
//                }
//                
//                if !viewModel.resume.name.isEmpty {
//                    NavigationLink(destination: ResumeDetailView(resume: $viewModel.resume)) {
//                        Text("Edit Resume")
//                            .fontWeight(.medium)
//                            .padding()
//                            .frame(maxWidth: .infinity)
//                            .background(Color(.systemGray6))
//                            .cornerRadius(10)
//                    }
//                } else {
//                    Text("No resume uploaded yet.")
//                        .foregroundColor(.gray)
//                        .padding(.top, 20)
//                }
//                
////                Spacer()
//            }
//            .padding()
//            .border(.red)
////            .navigationTitle("Resume Upload")
//        }
//    }
    
    func handleFileSelection(_ result: Result<[URL], Error>) {
        guard case let .success(urls) = result, let url = urls.first else { return }
        let ext = url.pathExtension.lowercased()

        if ext == "pdf" {
            if let pdf = PDFDocument(url: url), let text = pdf.string {
                viewModel.parseText(text)
            }
        } else if ext == "txt" || ext == "rtf" {
            if let text = try? String(contentsOf: url) {
                viewModel.parseText(text)
            }
        } else if ext == "docx" {
//            parseDocx(url: url)
        }
    }

//    func parseDocx(url: URL) {
//        guard let archive = try? ZipArchive(url: url),
//              let data = archive.extract("word/document.xml"),
//              let xml = String(data: data, encoding: .utf8) else {
//            return
//        }
//        let text = xml.replacingOccurrences(of: "<[^>]+>", with: " ", options: .regularExpression)
//        viewModel.parseText(text)
//    }
}

*/

#Preview {
    ResumeUploadView()
}
