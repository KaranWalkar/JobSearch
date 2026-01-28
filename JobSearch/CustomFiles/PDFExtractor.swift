import PDFKit

struct PDFExtractor {
    static func extract(from url: URL) -> String {
        guard let pdf = PDFDocument(url: url) else { return "" }
        return (0..<pdf.pageCount)
            .compactMap { pdf.page(at: $0)?.string }
            .joined(separator: "\n")
    }
}