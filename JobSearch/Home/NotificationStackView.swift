//
//  NotificationStackView.swift
//  JobSearch
//
//  Created by Walkar, Karan on 16/04/25.
//


import SwiftUI

//struct NotificationStackView: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}

//struct NotificationStackView : View {
//    @State var isExpanded = false
//    let cellHeight = 180
//    let colors : [Color] = [.yellow, .pink, .indigo, .green, .red, .orange]
//    
//    @State private var cardOffset: CGSize = .zero
//    
//    var body: some View {
//        VStack {
//            LazyVStack(spacing: isExpanded ? 20 :  -Double(cellHeight)) {
//                ForEach(0..<colors.count, id: \.self) { index in
//                    Text("Card \(index)")
//                        .frame(height: CGFloat(cellHeight))
//                        .frame(maxWidth: .infinity)
//                        .border(.black, width: 1)
//                        .background(.white.gradient)//colors[index].gradient)
//                        .clipShape(.rect(cornerRadius: 18))
//                        .padding(.horizontal)
//                    // if we dont manage the zindex then last view will be on top, we want first to be on top
//                        .zIndex(Double(colors.count - index))
//                        .offset(x: 0, y: getOffset(index: index))
//                        .opacity(getOpacity(with: index))
//                        .padding(.horizontal, getHorizonatalPadding(index: index))
//                    // handles smooth animation by taking elements insded a view as group
//                        .geometryGroup()
////                        .onTapGesture {
////                            withAnimation {
////                                isExpanded.toggle()
////                            }
////                        }
//                        .gesture(
//                            DragGesture()
//                                .onChanged({ gesture in
//                                    if abs(cardOffset)
//                                })
//                                .onEnded({ _ in
//                                    
//                                })
//                        )
//                }
//            }
//            .padding(.vertical)
//            Spacer()
//        }
//        .frame(maxWidth: .infinity, alignment: .top)
//    }
//}
//
private extension NotificationStackView {
    func getOffset(index: Int) -> CGFloat {
//        if isExpanded {
//            return 0
//        } else {
            switch index {
            case 0: return 0
            case 1: return CGFloat(-5)
            case 2: return CGFloat(-10)
            default: return CGFloat(20)
            }
//        }
    }
    
    func getHorizonatalPadding(index: Int) -> CGFloat {
//        if isExpanded {
//            return 0
//        } else {
            switch index {
            case 0: return 0
            case 1: return 5
            case 2: return 10
            default: return 10
            }
//        }
    }
    
//    func getOpacity(with index: Int) -> Double {
////        if isExpanded {
////            return 1
////        } else {
//            switch index {
//            case 0: return 1
//            case 1: return 0.75
//            case 2: return 0.5
//            default: return 0
//            }
////        }
//    }
}


// Data struct
struct Restaurant: Identifiable {
    let id = UUID()
    let name: String
}

struct NotificationStackView: View {
    // static data
    let restaurants = [
        Restaurant(name: "Joe's Original"),
        Restaurant(name: "The Real Joe's Original"),
        Restaurant(name: "Original Joe's")
    ]
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) { //<=== Here
                ForEach(restaurants.indices) { index in
                    NotificationView(restaurant: restaurants[index], index: index, isLast: index == restaurants.count - 1) //<=== Here
                        .padding(.horizontal)
                        .clipShape(.rect(cornerRadius: 18))
//                        .offset(x: 0, y: getOffset(index: index))
                        .padding(.horizontal, getHorizonatalPadding(index: index))
                }
            }
        }
    }
}

// Card View
struct NotificationView: View {
    var restaurant: Restaurant
    var index: Int
    var isLast: Bool
    
    let color: [Color] = [.blue, .red, .green]
    
    var body: some View {
        ZStack{
            color[index%3]
                .cornerRadius(10.0)
            Text("Come and eat at \(restaurant.name)")
                .padding(EdgeInsets(top: 20, leading: 20, bottom: isLast ? 20 : 30, trailing: 20))
                .foregroundColor(.white)
        }.offset(y: index == 0 ? 0 : CGFloat(-5 * index))
    }
}



#Preview {
    NotificationStackView()
}

