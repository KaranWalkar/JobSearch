//
//  SearchView.swift
//  JobSearch
//
//  Created by Chaitali Sawant on 28/01/26.
//

import Foundation
import SwiftUI

struct SearchView: View {

    var body: some View {
        ZStack {
            CustomBackground()
            
            VStack(spacing: 16) {
                Image(systemName: "magnifyingglass")
                    .font(.largeTitle)
                
                Text("Search Jobs")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("Search by title, company, skill, or location")
                    .foregroundColor(.secondary)
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    SearchView()
}
