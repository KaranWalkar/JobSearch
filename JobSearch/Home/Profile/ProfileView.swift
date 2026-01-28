//
//  ProfileView.swift
//  JobSearch
//
//  Created by Walkar, Karan on 16/07/25.
//

import SwiftUI

struct ProfileView: View {
    @Binding var resume: Resume
    @State private var isShowingSheet: Bool = true
    @State private var minY: CGFloat = 0
    @State private var maxY: CGFloat = 0

    var body: some View {
        ZStack {
            CustomBackground()
            
           VStack {
               HStack() {
                   Spacer()
                   NavigationLink(destination: ProfileDetailsView(resume: $resume)
                    .navigationBarBackButtonHidden()
                   ) {
                       Image(systemName: "pencil.line")
                           .font(.system(size: 20))
                           .foregroundColor(.white)
                   } //: NavigationLink
               }
               .padding(.trailing)
               
               ProfileHeaderView()
                   .captureYPosition()
                   .onPreferenceChange(ViewPositionKey.self) { value in
                       if let value = value {
                           withAnimation(.easeInOut(duration: 0.2)) {
                               minY = value.minY
                               maxY = value.maxY
                               //                                print("minY: \(minY), maxY: \(maxY)")
                           }
                       }
                   }
               
               VStack {
                   ResumeDetailView(resume: $resume, isEditable: false)
                   //                CustomBottomSheet(upperViewPosition: $maxY) {
                   //                } dismiss: {
                   //                }
               }
               .background(.clear)
               .mask(RoundedRectangle(cornerRadius: 20, style: .continuous).padding(.bottom, 0))
               
           }
//           .padding(.horizontal)
           .frame(maxHeight: .infinity)
            .coordinateSpace(name: "globalSpace") // Optional if using .global
        }
    }
}

struct ProfileHeaderView: View {
    var body: some View {
        ZStack {
            VStack {
                Button(action: {
                    //Change Profile Image
                }) {
                    Image("profilePic")
                        .resizable()
                        .clipShape(Circle())
                        .scaledToFit()
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                }
//                .frame(height: UIScreen.main.bounds.width/4)
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.circle)
                .controlSize(.small)
                .tint(.white.opacity(0.1))
                
//                ZStack {
//                    HStack() {
//                        Spacer()
//                        NavigationLink(destination: NotificationStackView()
//                            .navigationBarHidden(true)
//                        ) {
//                            Image(systemName: "pencil.line")
//                                .font(.system(size: 20))
//                                .foregroundColor(.white)
//                        } //: NavigationLink
//                    }
//                    
                    CustomText(fontText: "Karan Walkar", fontSize: 24)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
//                }
                
                HStack {
                    CustomText(fontText: "iOS Consultant", fontSize: 18)
                    CustomText(fontText: "•", fontSize: 18)
                    CustomText(fontText: "Tata Technologies", fontSize: 18)
                }
                .foregroundStyle(.white)
                
                HStack {
                    CustomText(fontText: "8+ years Exp", fontSize: 18)
                    CustomText(fontText: "•", fontSize: 18)
                    CustomText(fontText: "Mumbai", fontSize: 18)
                }
                .foregroundStyle(.white)
                
                HStack {
                    Image(systemName: "eye")
                        .font(.system(size: 12))
                    
                    CustomText(fontText: "Actively searching jobs", fontSize: 18)
                    
                    Spacer()
//                    NavigationLink(destination: NotificationStackView()
//                        .navigationBarHidden(true)
//                    ) {
//                        Image(systemName: "pencil.line")
//                            .font(.system(size: 20))
//                            .foregroundColor(.white)
//                    } //: NavigationLink
                    
                } //: HStack
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .background(.white.opacity(0.07))
                .clipShape(.capsule)
            }
            .padding(.horizontal)
        }
    }
}

struct ViewPosition: Equatable {
    let minY: CGFloat
    let maxY: CGFloat
}

struct ViewPositionKey: PreferenceKey {
    static var defaultValue: ViewPosition? = nil

    static func reduce(value: inout ViewPosition?, nextValue: () -> ViewPosition?) {
        value = nextValue()
    }
}


extension View {
    func captureYPosition(in coordinateSpace: CoordinateSpace = .global) -> some View {
        overlay(
            GeometryReader { proxy in
                Color.clear
                    .preference(
                        key: ViewPositionKey.self,
                        value: ViewPosition(
                            minY: proxy.frame(in: coordinateSpace).minY,
                            maxY: proxy.frame(in: coordinateSpace).maxY
                        )
                    )
            }
        )
    }
}




#Preview {
//    ProfileView(resume: .constant(Resume(name: "John Doe", email: "johndoe@example.com", phone: "+1234567890", education: ["B.Sc. in Computer Science"], experience: ["Software Developer at XYZ Corp"], skills: ["Swift", "iOS", "Objective-C"])))
//    ProfileView(resume: $resume)
}

