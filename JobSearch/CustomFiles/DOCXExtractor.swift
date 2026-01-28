import Foundation
//import ZIPFoundation
//
//struct DOCXExtractor {
//    static func extract(from url: URL) -> String {
//        guard let archive = Archive(url: url, accessMode: .read) else { return "" }
//        var text = ""
//        for entry in archive {
//            if entry.path == "word/document.xml" {
//                var data = Data()
//                _ = try? archive.extract(entry, consumer: { data.append($0) })
//                text = String(decoding: data, as: UTF8.self)
//            }
//        }
//        return text
//            .replacingOccurrences(of: "<[^>]+>", with: " ", options: .regularExpression)
//            .replacingOccurrences(of: "\s+", with: " ", options: .regularExpression)
//    }
//}
