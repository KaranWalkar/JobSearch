//
//  JobCardsView.swift
//  JobSearch
//
//  Created by Walkar, Karan on 21/03/25.
//

import SwiftUI

struct Job: Identifiable {
    let id = UUID()
    let logo: Image
    let companyName: String
    let designation: String
    let jobType: String
    let salary: String?
    let requirement: String?
    let skill: String?
    let qualification: String?
    var isBookmark: Bool?
    var isApplied: Bool?
    
    static var mockData: [Job] = [
//        Job(logo: Image(systemName: "profile.circle"), companyName: "Pinterest", designation: "iOS Developer", jobType: "Part Time", salary: "₹00K - ₹99K", qualification: "", isBookmark: false, isApplied: false),
        Job(logo: Image("pinterest"), companyName: "Pinterest", designation: "iOS Developer", jobType: "Part Time", salary: "₹00K - ₹99K", requirement: "", skill: "", qualification: "", isBookmark: false, isApplied: false),
        Job(logo: Image("apple"), companyName: "Apple India", designation: "Software Consultant", jobType: "Full Time", salary: "₹00K - ₹99K", requirement: "Broad range of iOS knowledge.", skill: "", qualification: "", isBookmark: false, isApplied: false),
        Job(logo: Image("google"), companyName: "Google India", designation: "Team Lead", jobType: "Part Time", salary: "₹00K - ₹99K", requirement: "", skill: "", qualification: "", isBookmark: false, isApplied: false),
        Job(logo: Image("amazon"), companyName: "Amazon India", designation: "Senior iOS Developer", jobType: "Full Time", salary: "₹00K - ₹99K", requirement: "", skill: "", qualification: "", isBookmark: false, isApplied: false),
        Job(logo: Image("linkedin"), companyName: "LinkedIn", designation: "Project Manager", jobType: "Full Time", salary: "₹00K - ₹99K", requirement: "", skill: "", qualification: "", isBookmark: false, isApplied: false)
    ]
}

struct MainCardView: View {
    var job: Job
    var isTopCard: Bool

  var body: some View {
      var tempJob = self.job
      VStack(alignment: .leading, spacing: 10) {
          HStack {
              self.job.logo
                  .resizable()
                  .clipShape(Circle())
//                  .border(.black, width: 1)
                  .aspectRatio(1, contentMode: .fit)
              
              Spacer()
              
              Button(action: {
                  tempJob.isBookmark = true
//                  self.job = tempJob
              }) {
                  HStack {
                      Image(systemName: "bookmark")
                          .imageScale(.large)
                          .foregroundColor(.black)
                  } //: HStack
                  .padding()
              } //: Button
              .buttonStyle(.borderedProminent)
              .buttonBorderShape(.circle)
              .controlSize(.small)
              .tint(.black.opacity(0.08))
          } //: HStack
          .frame(height: 50)
          
          Spacer()
          
          VStack(alignment: .leading, spacing: 15) {
              CustomText(fontText: self.job.companyName, fontSize: 24)
                  .frame(alignment: .topLeading)
              
              CustomText(fontText: self.job.designation, fontSize: 36)
                  .textCase(.uppercase)
                  .bold()
//                  .foregroundColor(Color(hex: "#181818"))
                  .lineLimit(nil)
          }
          
          Spacer()
          
          CustomText(fontText: self.job.salary ?? "", fontSize: 20)
          
          Spacer()
          
          NavigationLink(destination: DetailsView(jobObj: self.job)
            .navigationBarHidden(true)
          ) {
              CustomText(fontText: "See Details", fontSize: 20)
                  .fontWeight(.bold)
                  .foregroundColor(.white)
                  .padding()
              
          } //: NavigationLink
          .frame(maxWidth: .infinity)
          .background(isTopCard ? .black : .white.opacity(0.7))
          .clipShape(.capsule)
          
      } //: VStack
      .padding(20)
      .background(isTopCard ? Color.white : .white.opacity(0.9))
      .opacity(isTopCard ? 1.0 : 0.9)
      .cornerRadius(20)
      .shadow(radius: 1)
      .zIndex(isTopCard ? 1 : 0)
  }
}

struct Basic: View {
    
    @State private var data: [Job] = Job.mockData

  var body: some View {
    CardStack(
        direction: UpDown.direction,
      data: data,
      onSwipe: { card, direction in
//        print("Swiped \(card.name) to \(direction)")
      },
        content: { job, _, isOnTop in
            MainCardView(job: job, isTopCard: isOnTop)
        }
    )
    .environment(
      \.cardStackConfiguration,
      CardStackConfiguration(
        maxVisibleCards: 3,
        swipeThreshold: 0.1,
        cardOffset: 20,
        cardScale: 0.1,
        animation: .linear
      )
    )
    .padding()
    .frame(alignment: .center)
//    .navigationBarTitle("Basic", displayMode: .inline)
  }
}

/*
struct AddingCards: View {
    @State var data: [Job] = Array(Job.mockData.prefix(2))

  var body: some View {
    CardStack(
      direction: LeftRight.direction,
      data: data,
      onSwipe: { _, _ in
        self.data.append(Job.mockData.randomElement()!)
      },
      content: { job, _, _ in
          MainCardView(job: job)
      }
    )
    .padding()
    .scaledToFit()
    .frame(alignment: .center)
    .navigationBarTitle("Adding cards", displayMode: .inline)
  }
}

struct CustomDirection: View {
  enum MyDirection {
    case up, down

    static func direction(degrees: Double) -> Self? {
      switch degrees {
      case 315..<360, 0..<45: return .up
      case 135..<225: return .down
      default: return nil
      }
    }
  }

  @State var data: [Job] = Job.mockData

  var body: some View {
    CardStack(
      direction: MyDirection.direction,
      data: data,
      onSwipe: { card, direction in
//        print("Swiped \(card.name) to \(direction)")
      },
      content: { job, _, _ in
          MainCardView(job: job)
      }
    )
    .padding()
    .scaledToFit()
    .frame(alignment: .center)
    .navigationBarTitle("Custom direction", displayMode: .inline)
  }
}

struct CustomConfiguration: View {
  @State var data: [Job] = Job.mockData

  var body: some View {
    CardStack(
      direction: LeftRight.direction,
      data: data,
      onSwipe: { card, direction in
//        print("Swiped \(card.name) to \(direction)")
      },
      content: { job, _, _ in
          MainCardView(job: job)
      }
    )
    .environment(
      \.cardStackConfiguration,
      CardStackConfiguration(
        maxVisibleCards: 3,
        swipeThreshold: 0.1,
        cardOffset: 40,
        cardScale: 0.2,
        animation: .linear
      )
    )
    .padding()
    .scaledToFit()
    .frame(alignment: .center)
    .navigationBarTitle("Custom configuration", displayMode: .inline)
  }
}
*/
struct JobCardsView: View {
    var body: some View {
        Basic()
//        NavigationView {
//            List {
//                NavigationLink(destination: Basic()) {
//                    Text("Basic")
//                }
//                NavigationLink(destination: AddingCards()) {
//                    Text("AddingCards")
//                }
//                NavigationLink(destination: CustomDirection()) {
//                    Text("CustomDirection")
//                }
//                NavigationLink(destination: CustomConfiguration()) {
//                    Text("CustomConfiguration")
//                }
//            }
//        }
    }
}

#Preview {
    JobCardsView()
}
