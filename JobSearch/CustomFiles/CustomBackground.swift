//
//  CustomBackground.swift
//  JobSearch
//
//  Created by Walkar, Karan on 19/03/25.
//

import SwiftUI

struct CustomBackground: View {
    var body: some View {
        
        ZStack {
            LinearGradient(colors: [Color(hex: "#546694"), Color(hex: "#2B304E") ], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
        }
    }
}

#Preview {
    CustomBackground()
}
