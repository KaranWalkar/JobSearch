//
//  HeaderView.swift
//  JobSearch
//
//  Created by Chaitali Sawant on 28/01/26.
//

import SwiftUI

struct HeaderView: View {
    
    let profileName: String

    var body: some View {
        HStack {
            Image("profilePic")
                .resizable()
                .clipShape(.circle)
                .padding(5)
                .scaledToFit()
//                .font(.system(size: 14))
                .background(.white.opacity(0.07))
                .clipShape(.circle)
                .frame(height: 70)
            
            
            VStack(alignment: .leading, spacing: 8) {
                Text(profileName)
                    .font(.title3)
                    .foregroundColor(.white)

                CustomText(fontText: "Find your next job", fontSize: 18)
                    .fontWeight(.bold)
            }
            
            Spacer()
            
            NavigationLink(destination:
                NotificationStackView()
//                    .modifier(HideNavBarOnIOS())
            ) {
                Image(systemName: "bell")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .padding()
                
            } //: NavigationLink
            .background(.white.opacity(0.07))
            .clipShape(.circle)
        }
        .padding(10)
        
    }
}

#Preview {
    HeaderView(profileName: "Welcome Karan")
        .background(Color.blue)
}
