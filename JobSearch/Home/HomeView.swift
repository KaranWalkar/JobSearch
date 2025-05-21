//
//  HomeView.swift
//  JobSearch
//
//  Created by Walkar, Karan on 17/03/25.
//

import SwiftUI


extension Color {
    // A Color initializer that accepts a hex string (e.g., "#FF5733" or "FF5733")
    init(hex: String) {
        let hexSanitized = hex.replacingOccurrences(of: "#", with: "")
        
        // Convert hex string to RGB values
        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgb & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}

struct HomeView: View {
    
    var profilePicture: Image? = nil
    
    var body: some View {
        
        ZStack {
            CustomBackground()
            
            VStack(spacing: 10) {
                // Header
                HStack {
                    Button(action: {
                        //Change Profile Image
                    }) {
//                        self.profilePicture ?? Image(systemName: "person")
                        Image("profilePic") 
                            .resizable()
                            .clipShape(Circle())
                            .scaledToFit()
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                    }
                    .frame(width: 90)
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.circle)
                    .controlSize(.small)
                    .tint(.white.opacity(0.1))
                    
                    VStack(alignment: .leading) {
                        CustomText(fontText: "Welcome", fontSize: 18)
                        
                        CustomText(fontText: "Karan Walkar", fontSize: 20)
                            .fontWeight(.bold)
                    }
                    .foregroundStyle(.white)
                    
                    Spacer()

                    Button(action: {
                        //Change Profile Image
                    }) {
                        HStack {
                            Image(systemName: "bell")
                                .font(.system(size: 24))
                                .foregroundColor(.white)
                        }
                        .padding()
                    }
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.circle)
                    .controlSize(.small)
                    .tint(.white.opacity(0.07))
                    
                }
                //: Header
                
                VStack {
//                    HStack {
//                        CustomText(fontText: "Your Profile Performance", fontSize: 18)
//                            .foregroundColor(.white)
//                        CustomText(fontText: "(in last 30 days)", fontSize: 12)
//                            .foregroundColor(.gray)
//                    }
                    HStack {
                        InfoCard(title: "Profile Viewed", value: "10", icon: "")
                        InfoCard(title: "Contacted You", value: "20", icon: "")
                        InfoCard(title: "Profile Bookmark", value: "0", icon: "")
                    }
//                    .padding(20)
                }
                HStack {
                    
                    
//                    Button(action: {
//                    }) {
//                        HStack {
////                            Image(systemName: "slider.horizontal.3")
////                                .font(.system(size: 24))
//

//                        } //: HStack
//                    } //: Button
//                    .padding()
//                    .tint(.white)
//                    .background(.white.opacity(0.07))
//                    .clipShape(.capsule)
                    
//                    Button(action: {
//                    }) {
//                        HStack {
////                            Image(systemName: "slider.horizontal.3")
////                                .font(.system(size: 24))
//                            
//                            CustomText(fontText: "Applied Jobs", fontSize: 14)
//                                .lineLimit(1)
////                                .fixedSize()
//                        } //: HStack
//                    } //: Button
//                    .padding()
//                    .tint(.white)
//                    .background(.white.opacity(0.07))
//                    .clipShape(.capsule)
                    
//                    Spacer()
                    Button(action: {
                    }) {
                        HStack {
                            Image(systemName: "slider.horizontal.3")
                                .font(.system(size: 24))
                            
                            CustomText(fontText: "Filters", fontSize: 18)
                        } //: HStack
                    } //: Button
                    .padding()
                    .tint(.white)
                    .background(.white.opacity(0.07))
                    .clipShape(.capsule)
                    
                    Spacer()
                    Button(action: {
                    }) {
                        HStack {
                            Image(systemName: "list.bullet") //square.stack.3d.up
                                .font(.system(size: 24))
                        } //: HStack
                    } //: Button
                    .padding()
                    .tint(.white)
                    .background(.white.opacity(0.07))
                    .clipShape(.circle)
                } //: HStack
                
                CustomText(fontText: "Jobs for you", fontSize: 18)
                    .foregroundColor(.white)
                JobCardsView()
                
                Spacer()
                
                // Custom Bottom Menu Bar
                CustomMenuBar()
            }
            .padding(15)
//            .frame(maxHeight: .infinity, alignment: .bottom)

        }
        
        
    }
}

#Preview {
    HomeView()
//    CustomBackground()
}
