//
//  DetailsView.swift
//  JobSearch
//
//  Created by Walkar, Karan on 03/04/25.
//

import SwiftUI

struct DetailsView: View {
    
    @State var jobObj : Job
    
//    @State private var isShowingSheet: Bool = true
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            CustomBackground()
            
            VStack {
                // Navigation Bar
//                HStack {
//                    Button(action: {
//                        // Handle back action
//                        self.dismiss()
//                    }) {
//                        Image(systemName: "arrow.left")
//                            .font(.title2)
//                            .foregroundColor(.white)
//                    }
//                    .padding()
//                    .tint(.white)
//                    .background(.white.opacity(0.07))
//                    .clipShape(.circle)
//                    
//                    Spacer()
//                    
//                    CustomText(fontText: "Job Details", fontSize: 20)
//                        .foregroundColor(.white)
//                    
//                    Spacer()
//                    
//                    Button(action: {
//                        // Handle menu action
//                    }) {
//                        Image(systemName: "ellipsis")
//                            .font(.title2)
//                            .foregroundColor(.white)
//                    }
//                    .padding()
//                    .tint(.white)
//                    .background(.white.opacity(0.07))
//                    .clipShape(.circle)
//                }
//                .padding()
                
                CustomNavigationBar(titleText: "Job Details", buttonImage: "ellipsis")
                
                let jobDesignation = self.jobObj.designation + "\nat " + self.jobObj.companyName // "Market Consultant at Google"
                // Job Title
                CustomText(fontText: jobDesignation, fontSize: 30)
                    .bold()
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
//                    .padding(.top, 20)
                
                
                // Job Type & Salary
                HStack {
                    InfoCard(title: "Job type", value: self.jobObj.jobType, icon: "briefcase")
                    InfoCard(title: "Salary", value: self.jobObj.salary ?? "$00-$00K", icon: "creditcard")
                }
                .padding(20)
                
                
                // Preferred Qualifications
                VStack {
                    // Underline
                    Rectangle()
                        .frame(width: 100, height: 3) // Adjust width & thickness
                        .foregroundColor(.black.opacity(0.1)) // Color of the underline
                        .cornerRadius(2)
                        .padding()
//                        .frame(maxWidth: .infinity, alignment: .center) // Center the VStack
                    
                    VStack(alignment: .leading, spacing: 20) {
                        CustomText(fontText: "Preferred Qualifications:", fontSize: 20)
                            .fontWeight(.semibold)
                        
                        HStack {
                            if let value = self.jobObj.requirement {
                                QualificationCard(icon: "lightbulb.max", text: value != "" ? value : "Broad range of app knowledge.")
                            }
                            if let value = self.jobObj.skill {
                                QualificationCard(icon: "eyeglasses", text: value != "" ? value : "Excellent presentation skills.")
                            }
                        }
                        .shadow(radius: 5)
                        
                        if let value = self.jobObj.qualification {
                            QualificationCard(icon: "folder.badge.gearshape", text: value != "" ? value : "Experience implementing large-scale iOS projects, risk management/mitigation and supporting change management.")
                                .shadow(radius: 5)
                        }
                    }
                    .padding([.leading, .trailing], 20)
                   
                    Spacer()
                   
                    // Apply Button
                    Button(action: {
                        // Handle apply now action
                        self.dismiss()
                        self.jobObj.isApplied = true
                    }) {
                        CustomText(fontText: "Apply Now", fontSize: 18)
                            .bold()
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(hex: "#2B304E"))
                            .foregroundColor(.white)
                            .cornerRadius(15)
                    }
                    .clipShape(.capsule)
                    .padding([.top, .horizontal])
                }
                .background(.white)
                .mask(RoundedRectangle(cornerRadius: 20, style: .continuous).padding(.bottom, -30))
                
            }
            
        }
    }
}


struct InfoCard: View {
    var title: String
    var value: String
    var icon: String?
    
    var body: some View {
        HStack {
            if let imageValue = icon, imageValue != "" {
                Image(systemName: imageValue)
                    .foregroundColor(.white.opacity(0.7))
                    .frame(width: 30, height: 30)
            }
            
            VStack(alignment: icon != "" ? .leading : .center) {
                CustomText(fontText: title, fontSize: 16)
                    .foregroundColor(.white.opacity(0.7))
                    .multilineTextAlignment(.center)
                
                CustomText(fontText: value, fontSize: 18)
                    .bold()
                    .foregroundColor(.white)
                    .lineLimit(1)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white.opacity(0.2))
        .cornerRadius(15)
    }
}

struct QualificationCard: View {
    var icon: String
    var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(.black)
                .frame(width: 40, height: 40)
                .background(Color.gray.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            CustomText(fontText: text, fontSize: 18)
                .foregroundColor(.black)
//                .padding(.leading, 5)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}


#Preview {
    DetailsView(jobObj: Job(logo: Image("pinterest"), companyName: "Pinterest", designation: "iOS Developer", jobType: "Part Time", salary: "₹00K - ₹99K", requirement: "", skill: "", qualification: "", isBookmark: false, isApplied: false))
    
}
