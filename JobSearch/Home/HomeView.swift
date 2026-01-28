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
    @AppStorage("cardview") var isCardView: Bool = true
    
    var body: some View {
        
        ZStack {
//            CustomBackground()
            
            VStack() {
                // Header
                HStack {
                    Image("profilePic")
                        .resizable()
                        .clipShape(.circle)
                        .padding(5)
                        .scaledToFit()
                        .font(.system(size: 14))
                        .background(.white.opacity(0.07))
                        .clipShape(.circle)
                    
                    VStack(alignment: .leading) {
                        CustomText(fontText: "Welcome", fontSize: 18)
                        
                        CustomText(fontText: "Karan Walkar", fontSize: 20)
                            .fontWeight(.bold)
                    }
                    .foregroundStyle(.white)
                    
                    Spacer()
                    
                    NavigationLink(destination:
                        NotificationStackView()
                            .modifier(HideNavBarOnIOS())
                    ) {
                        Image(systemName: "bell")
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                            .padding()
                        
                    } //: NavigationLink
                    .background(.white.opacity(0.07))
                    .clipShape(.circle)
                    
                } //: Header
                .frame(height: 80)
                
                HStack {
                    InfoCard(title: "Profile Viewed", value: "20", icon: "")
                    InfoCard(title: "Contacted You", value: "10", icon: "")
                    InfoCard(title: "Profile Bookmark", value: "0", icon: "")
                }
                .padding(10)
                
                HStack {
                    Button(action: {
                    }) {
                        HStack {
                            CustomText(fontText: "My Jobs", fontSize: 18)
                                .lineLimit(1)
                        } //: HStack
                    } //: Button
                    .padding()
                    .tint(.white)
                    .background(.white.opacity(0.07))
                    .clipShape(.capsule)
                    
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
                        withAnimation {
                            isCardView.toggle()
                        }
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
                .padding(10)
                
                if isCardView {
                    StackedCardView()
                        .frame(maxHeight: .infinity)
                        .padding(.vertical)
                } else {
                    ListView()
                }
            }
            .padding(15)
            .frame(maxHeight: .infinity, alignment: .top)
        }
        
    }
}

// A helper view modifier to hide the navigation bar on iOS only.
// On iOS 16+, prefer the toolbar-based API; this keeps broad compatibility.
private struct HideNavBarOnIOS: ViewModifier {
    func body(content: Content) -> some View {
        #if os(iOS)
        if #available(iOS 16.0, *) {
            content
                .toolbar(.hidden, for: .navigationBar)
        } else {
            content
                .navigationBarHidden(true)
        }
        #else
        content
        #endif
    }
}

#Preview {
    HomeView()
//    CustomBackground()
}

