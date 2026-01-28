//
//  ProfileDetailsView.swift
//  JobSearch
//
//  Created by Walkar, Karan on 16/07/25.
//

import SwiftUI

struct ProfileDetailsView: View {
    @Binding var resume: Resume
    
    var body: some View {
        ZStack {
            CustomBackground()
            VStack {
                // Navigation Bar
                CustomNavigationBar(titleText: "Profile Details", buttonImage: "")
                
                ResumeDetailView(resume: $resume, headerColor: .white)
            }
        }
    }
}

#Preview {
//    ProfileDetailsView(resume: .constant(Resume(name: "John Doe", email: "johndoe@example.com", phone: "+1234567890", education: ["B.Sc. in Computer Science"], experience: ["Software Developer at XYZ Corp"], skills: ["Swift", "iOS", "Objective-C"])))
}
