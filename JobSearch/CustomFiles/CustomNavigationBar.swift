//
//  CustomNavigationBar.swift
//  JobSearch
//
//  Created by Walkar, Karan on 09/07/25.
//

import SwiftUI

struct CustomNavigationBar: View {
    var titleText: String
    var buttonImage: String
    
//    @State private var isShowTitle: Bool = true
//    @State private var isShowMoreButton: Bool = true
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        ZStack {
//            CustomBackground()
            
            // Navigation Bar
            HStack() {
                
                Button(action: {
                    // Handle back action
                    self.dismiss()
                }) {
                    Image(systemName: "arrow.left")
                        .font(.title2)
                        .foregroundColor(.white)
                }
                .padding()
                .tint(.white)
                .background(.white.opacity(0.07))
                .clipShape(.circle)
                
                Spacer()
                
                if !titleText.isEmpty {
                    CustomText(fontText: titleText, fontSize: 24)
                        .foregroundColor(.white)
                }
                
                Spacer()
                
//                if !buttonImage.isEmpty {
                    Button(action: {
                        // Handle menu action
                    }) {
                        Image(systemName: buttonImage)
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .tint(.white)
                    .background(!buttonImage.isEmpty ? .white.opacity(0.07) : .clear)
                    .clipShape(.circle)
//                }
                
            }
            .padding()
            .frame(height: 60)
            
        }
    }
}

#Preview {
    CustomNavigationBar(titleText: "Title", buttonImage: "")
}
