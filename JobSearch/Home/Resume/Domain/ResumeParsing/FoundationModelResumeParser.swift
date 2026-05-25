//
//  FoundationModelResumeParser.swift
//  JobSearch
//
//  Created by Walkar, Karan on 27/01/26.
//

import PDFKit
//import Vision

final class ResumeTextExtractor {

    func extractText(from url: URL) async throws -> String {

        let accessing = url.startAccessingSecurityScopedResource()
        defer {
            if accessing {
                url.stopAccessingSecurityScopedResource()
            }
        }
        
        if url.pathExtension.lowercased() == "pdf" {
            return extractPDF(url)
        }

        if url.isImage {
//            return try await extractImageText(url)
        }

        if url.pathExtension.lowercased() == "txt" {
            return try String(contentsOf: url)
        }

        throw ResumeError.unsupportedFormat
    }

    private func extractPDF(_ url: URL) -> String {
        guard let pdf = PDFDocument(url: url) else { return "" }
        return (0..<pdf.pageCount)
            .compactMap { pdf.page(at: $0)?.string }
            .joined(separator: "\n")
    }

//    private func extractImageText(_ url: URL) async throws -> String {
//        let image = CIImage(contentsOf: url)!
//        let request = VNRecognizeTextRequest()
//        let handler = VNImageRequestHandler(ciImage: image)
//        try handler.perform([request])
//        return request.results?
//            .compactMap { $0.topCandidates(1).first?.string }
//            .joined(separator: "\n") ?? ""
//    }
}

extension URL {
    var isImage: Bool {
        ["png", "jpg", "jpeg"].contains(pathExtension.lowercased())
    }
}

enum ResumeError: Error {
    case unsupportedFormat
}

/*
import Foundation

final class FoundationModelResumeParser {

    func parse(text: String) async throws -> ParsedResumeDTO {
        // Foundation Models call here
        // For now: mock / placeholder
        return ParsedResumeDTO(
            name: "John Doe",
            email: "john@doe.com",
            skills: ["Swift", "SwiftUI"],
            experiences: []
        )
    }
}
*/
