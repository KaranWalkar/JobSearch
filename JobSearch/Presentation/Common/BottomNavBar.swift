//
//  BottomNavBar.swift
//  JobSearch
//
//  Created by Chaitali Sawant on 28/01/26.
//

import Foundation
import SwiftUI

struct BottomNavBar: View {
    var body: some View {
        HStack {
            Spacer()
            Image(systemName: "house.fill")
            Spacer()
            Image(systemName: "magnifyingglass")
            Spacer()
            Image(systemName: "bookmark")
            Spacer()
            Image(systemName: "person")
            Spacer()
        }
        .padding()
        .background(.ultraThinMaterial)
    }
}
