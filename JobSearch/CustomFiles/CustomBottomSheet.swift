//
//  CustomBottomSheet.swift
//  JobSearch
//
//  Created by Walkar, Karan on 16/07/25.
//

import SwiftUI

//struct ViewFramePreferenceKey: PreferenceKey {
//    static var defaultValue: CGRect = .zero
//    
//    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
//        value = nextValue()
//    }
//}

struct CustomBottomSheet<Content: View>: View {
    @Binding var upperViewPosition: CGFloat
    let content: () -> Content
    let dismiss: () -> Void
        
    
    @GestureState private var dragOffset = CGFloat.zero
    @State private var currentOffset: CGFloat = 0
    @State private var sheetHeight: CGFloat = 0
//    @State var upperViewPosition: CGFloat = 0
    
    var body: some View {
        GeometryReader { geometry in
            
            let screenHeight = geometry.size.height
            let maxHeight = sheetHeight
            let minOffset = screenHeight - maxHeight // top position (fully expanded)
            
            let maxOffset = screenHeight - upperViewPosition// + 10 //screenHeight * 0.5 // where sheet starts (collapsed)

            ZStack {
                // Background dimming
                Color.clear//black.opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        dismiss()
                    }

                VStack {
                    Capsule()
                        .frame(width: 40, height: 6)
                        .foregroundColor(.gray)
                        .padding(.top, 8)

                    content()
                        .background(
                            GeometryReader { geo in
                                Color.clear
                                    .onAppear {
                                        sheetHeight = geo.size.height + 40 // 40 = padding/top grip
                                        currentOffset = (upperViewPosition - minOffset) + 40 //maxOffset
                                        print("current Offset: \(currentOffset) upperViewPosition: \(upperViewPosition) sheetHeight: \(sheetHeight) screenHeight: \(screenHeight)")
                                    }
                            }
                        )
                }
                .padding(.bottom, geometry.safeAreaInsets.bottom)
                .background(Color(.systemBackground))
                .cornerRadius(16)
                .offset(y: max(minOffset, min(currentOffset + dragOffset, maxOffset)))
                .gesture(
                    DragGesture()
                        .updating($dragOffset) { value, state, _ in
                            state = value.translation.height
                        }
                        .onEnded { value in
                            let newOffset = currentOffset + value.translation.height
                            let midpoint = (minOffset + maxOffset) / 2
                            
                            withAnimation(.spring()) {
                                if newOffset < midpoint {
                                    currentOffset = minOffset
                                } else {
                                    currentOffset = maxOffset
                                }
                            }
                        }
                )
            }
            .animation(.easeInOut, value: currentOffset)
        }
    }
}

#Preview {
    @Previewable @State var maxY: CGFloat = 40
//    CustomBottomSheet(upperViewPosition: $maxY) {
////        ProfileDetailsView(resume: .constant(Resume(name: "John Doe", email: "johndoe@example.com", phone: "+1234567890", education: ["B.Sc. in Computer Science"], experience: ["Software Developer at XYZ Corp"], skills: ["Swift", "iOS", "Objective-C"])))
//    } dismiss: {
//    }
}
