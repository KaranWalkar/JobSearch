//
//  CustomText.swift
//  JobSearch
//
//  Created by Walkar, Karan on 04/04/25.
//

import SwiftUI

struct CustomText: View {
    var fontText: String
    var fontSize: CGFloat
    
    var body: some View {
        Text(fontText)
            .font(.custom("Helvetica",size: fontSize))
    }
}

#Preview {
    CustomText(fontText: "Karan", fontSize: 18)
}
