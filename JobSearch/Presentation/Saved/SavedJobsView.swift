//
//  SavedJobsView.swift
//  JobSearch
//
//  Created by Chaitali Sawant on 28/01/26.
//

import Foundation
import SwiftUI

struct SavedJobsView: View {

    var body: some View {
        ZStack {
            CustomBackground()
            
            VStack(spacing: 16) {
                Image(systemName: "bookmark.fill")
                    .font(.largeTitle)
                
                Text("Saved Jobs")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("Jobs you bookmarked will appear here")
                    .foregroundColor(.secondary)
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    SavedJobsView()
}
