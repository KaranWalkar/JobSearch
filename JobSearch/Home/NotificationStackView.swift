//
//  NotificationStackView.swift
//  JobSearch
//
//  Created by Walkar, Karan on 16/04/25.
//


import SwiftUI

struct NotificationStackView : View {

    var body: some View {
        ZStack {
            CustomBackground()
            
            VStack {
                // Navigation Bar
                CustomNavigationBar(titleText: "Notifications", buttonImage: "")
                Spacer()
            }
        }
    }
}

#Preview {
    NotificationStackView()
}

