//
//  GlobalBackgroundColor.swift
//  JobSearch
//
//  Created by Chaitali Sawant on 30/01/26.
//

import SwiftUI

struct GlobalBackground<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        ZStack {
            CustomBackground()
            content
        }
        .ignoresSafeArea()
    }
}
