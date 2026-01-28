//
//  ResumeParser.swift
//  JobSearch
//
//  Created by Walkar, Karan on 24/07/25.
//

import Foundation

struct IntelligentResumeParser {
    static func parse(text: String) -> Resume {
        let resume = Resume()
        resume.rawText = text
        resume.name = extractName(from: text)
        resume.email = extract(pattern: "[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}", from: text)
        resume.phone = extract(pattern: "(\\+?\\d{1,3}[\\s-]?)?(\\(?\\d{3}\\)?[\\s-]?)?\\d{3}[\\s-]?\\d{4}", from: text)
        resume.sections = extractSections(from: text)
        return resume
    }

    private static func extractSections(from text: String) -> [ResumeSection] {

        let lines = text
            .components(separatedBy: .newlines)
            .map { $0.trimmingCharacters(in: .whitespaces) }
            .filter { !$0.isEmpty }

        var sections: [ResumeSection] = []
        var currentTitle: String?
        var buffer: [String] = []

        for line in lines {
            if isHeader(line) {
                if let title = currentTitle {
                    let sub = ResumeSubSection(content: buffer.joined(separator: "\n"))
                    sections.append(
                        ResumeSection(title: title, subSections: [sub])
                    )
                }
                currentTitle = normalize(line)
                buffer = []
            } else {
                buffer.append(line)
            }
        }

        if let title = currentTitle {
            let sub = ResumeSubSection(content: buffer.joined(separator: "\n"))
            sections.append(
                ResumeSection(title: title, subSections: [sub])
            )
        }

        return sections
    }
    
//    private static func normalize(_ header: String) -> String {
//        header
//            .replacingOccurrences(of: ":", with: "")
//            .trimmingCharacters(in: .whitespacesAndNewlines)
//    }
//
//    private static func isHeader(_ line: String) -> Bool {
//        line.count < 40 && (line.uppercased() == line || line.hasSuffix(":"))
//    }
    
    private static func isHeader(_ line: String) -> Bool {
        guard line.count < 40 else { return false }

        let uppercaseRatio =
            Double(line.filter { $0.isUppercase }.count) /
            Double(max(line.count, 1))

        let isAllCaps = uppercaseRatio > 0.6
        let endsWithColon = line.hasSuffix(":")

        return isAllCaps || endsWithColon
    }

    private static func normalize(_ header: String) -> String {
        header
            .replacingOccurrences(of: ":", with: "")
            .trimmingCharacters(in: .whitespacesAndNewlines)
    }


    private static func extractName(from text: String) -> String {
        text.components(separatedBy: .newlines).prefix(5).first ?? ""
    }

    private static func extract(pattern: String, from text: String) -> String {
        let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        let range = NSRange(text.startIndex..., in: text)
        guard let match = regex?.firstMatch(in: text, range: range),
              let r = Range(match.range, in: text) else { return "" }
        return String(text[r])
    }
}


/*
struct ResumeParser {
    static func extractName(from text: String) -> String {
        // Naive assumption: first non-empty line is name
        return text.components(separatedBy: .newlines).first { !$0.trimmingCharacters(in: .whitespaces).isEmpty } ?? ""
    }

    static func extractEmail(from text: String) -> String {
        let pattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return extractFirstMatch(from: text, with: pattern)
    }

    static func extractPhone(from text: String) -> String {
        let pattern = "(\\+\\d{1,2}\\s?)?\\(?\\d{3}\\)?[\\s.-]?\\d{3}[\\s.-]?\\d{4}"
        return extractFirstMatch(from: text, with: pattern)
    }

    static func extractEducation(from text: String) -> [String] {
        let eduKeywords = ["Bachelor", "Master", "B.Sc", "M.Sc", "B.Tech", "M.Tech", "B.A", "M.A", "Ph.D", "University", "College"]
        return extractLines(containing: eduKeywords, from: text)
    }

    static func extractExperience(from text: String) -> [String] {
        let expKeywords = ["Company", "Inc", "LLC", "Technologies", "Developer", "Engineer", "Worked", "Experience"]
        return extractLines(containing: expKeywords, from: text)
    }

    static func extractSkills(from text: String) -> [String] {
        let knownSkills = ["Swift", "iOS", "Objective-C", "Java", "Kotlin", "Python", "UI/UX", "Xcode", "Figma"]
        return knownSkills.filter { text.localizedCaseInsensitiveContains($0) }
    }

    // Helpers
    private static func extractFirstMatch(from text: String, with pattern: String) -> String {
        if let range = text.range(of: pattern, options: .regularExpression) {
            return String(text[range])
        }
        return ""
    }

    private static func extractLines(containing keywords: [String], from text: String) -> [String] {
        let lines = text.components(separatedBy: .newlines)
        return lines.filter { line in
            keywords.contains { keyword in
                line.localizedCaseInsensitiveContains(keyword)
            }
        }
    }
}
*/
