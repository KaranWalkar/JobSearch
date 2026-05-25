//
//  FlowLayout.swift
//  JobSearch
//
//  Created by Chaitali Sawant on 09/02/26.
//

import SwiftUI

struct SkillsView: View {

    let skills: [String]

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Skills")
                .font(.headline)
            
            FlowLayout {
                ForEach(skills, id: \.self) { skill in
                    Text(skill)
                        .font(.caption)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(Color.blue.opacity(0.2))
                        .clipShape(Capsule())
                }
            }
        }
    }
}


struct FlowLayout: Layout {

    var spacing: CGFloat = 8

    func sizeThatFits(
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) -> CGSize {

        let maxWidth = proposal.width ?? .infinity
        var width: CGFloat = 0
        var height: CGFloat = 0
        var rowHeight: CGFloat = 0

        for subview in subviews {
            let size = subview.sizeThatFits(.unspecified)

            if width + size.width > maxWidth {
                width = 0
                height += rowHeight + spacing
                rowHeight = 0
            }

            width += size.width + spacing
            rowHeight = max(rowHeight, size.height)
        }

        height += rowHeight
        return CGSize(width: maxWidth, height: height)
    }

    func placeSubviews(
        in bounds: CGRect,
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) {

        var x = bounds.minX
        var y = bounds.minY
        var rowHeight: CGFloat = 0

        for subview in subviews {
            let size = subview.sizeThatFits(.unspecified)

            if x + size.width > bounds.maxX {
                x = bounds.minX
                y += rowHeight + spacing
                rowHeight = 0
            }

            subview.place(
                at: CGPoint(x: x, y: y),
                proposal: ProposedViewSize(size)
            )

            x += size.width + spacing
            rowHeight = max(rowHeight, size.height)
        }
    }
}


#Preview {
    SkillsView(
        skills: [
            "Swift", "SwiftUI", "Combine", "SwiftData",
            "Resume Parsing", "Clean Architecture", "PDFKit"
        ]
    )
    .padding()
    .frame(width: 320)
}

