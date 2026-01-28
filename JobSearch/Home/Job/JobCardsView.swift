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
    var isBookmark: Bool //= false
    var isApplied: Bool
    
    static var mockData: [Job] = [
//        Job(logo: Image(systemName: "profile.circle"), companyName: "Pinterest", designation: "iOS Developer", jobType: "Part Time", salary: "₹00K - ₹99K", qualification: "", isBookmark: false, isApplied: false),
        Job(logo: Image("pinterest"), companyName: "Pinterest", designation: "iOS Developer", jobType: "Part Time", salary: "₹00K - ₹99K", requirement: "", skill: "", qualification: "", isBookmark: false, isApplied: false),
        Job(logo: Image("apple"), companyName: "Apple India", designation: "Software Consultant", jobType: "Full Time", salary: "₹00K - ₹99K", requirement: "Broad range of iOS knowledge.", skill: "", qualification: "", isBookmark: false, isApplied: false),
        Job(logo: Image("google"), companyName: "Google India", designation: "Team Lead", jobType: "Part Time", salary: "₹00K - ₹99K", requirement: "", skill: "", qualification: "", isBookmark: false, isApplied: false),
        Job(logo: Image("amazon"), companyName: "Amazon India", designation: "Senior iOS Developer", jobType: "Full Time", salary: "₹00K - ₹99K", requirement: "", skill: "", qualification: "", isBookmark: false, isApplied: false),
        Job(logo: Image("linkedin"), companyName: "LinkedIn", designation: "Project Manager", jobType: "Full Time", salary: "₹00K - ₹99K", requirement: "", skill: "", qualification: "", isBookmark: false, isApplied: false)
    ]
}

/*
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
                  tempJob.isBookmark.toggle()
              }) {
                  HStack {
//                      Image(systemName: "bookmark")
                      Image(systemName: tempJob.isBookmark ? "bookmark.fill" : "bookmark")
                          .imageScale(.large)
                          .foregroundColor(job.isBookmark ? .black : .gray)
                  } //: HStack
                  .padding()
              } //: Button
              .buttonStyle(.borderedProminent)
              .buttonBorderShape(.circle)
              .controlSize(.small)
              .tint(.black.opacity(0.08))
          } //: HStack
          .frame(height: 50)
          
//          Spacer()
          
          VStack(alignment: .leading, spacing: 15) {
              CustomText(fontText: self.job.companyName, fontSize: 24)
                  .frame(alignment: .topLeading)
              
              CustomText(fontText: self.job.designation, fontSize: 36)
                  .textCase(.uppercase)
                  .bold()
//                  .foregroundColor(Color(hex: "#181818"))
//                  .lineLimit(nil)
          }
          
//          Spacer()
          
          CustomText(fontText: self.job.salary ?? "", fontSize: 20)
          
//          Spacer()
          
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
*/

/*
struct Basic: View {
    
//    @State private var data: [Job] = Job.mockData
    @State private var jobs: [Job] = Job.mockData
    @State var isExpanded = false
    let cellHeight = 200

  var body: some View {
      /*
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
       */
      VStack {
          LazyVStack(spacing: isExpanded ? 20 :  -Double(cellHeight)) {
              ForEach($jobs) { $job in
                  ListCardView(job: job, isTopCard: false)
//                  MainCardView(job: tempJob, isTopCard: true)
              }
          }
          .padding(.vertical)
          Spacer()
      }
      .frame(maxWidth: .infinity, alignment: .top)
  }
}
struct ListCardView: View {
    var job: Job
    var isTopCard: Bool
//    @AppStorage("cardview") var isCardView: Bool = true
    
  var body: some View {
      var tempJob = self.job
      
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

*/

struct JobCardView: View {
    var job: Job
    var body: some View {
        var tempJob = self.job
        VStack(alignment: .leading) {
//            HStack {
//                job.logo
//                    .resizable()
//                    .frame(width: 40, height: 40)
//                VStack(alignment: .leading) {
//                    Text(job.companyName).font(.headline)
//                    Text(job.designation).font(.subheadline)
//                }
//                Spacer()
//            }
            
//            Text(tempJob.salary ?? "")
//                .font(.subheadline)
//                .foregroundColor(.gray)
            
            HStack {
                tempJob.logo
                    .resizable()
                    .clipShape(Circle())
//                  .border(.black, width: 1)
                    .aspectRatio(1, contentMode: .fit)
                
                Spacer()
                
                Button(action: {
                    tempJob.isBookmark.toggle()
                }) {
                    HStack {
                        Image(systemName: tempJob.isBookmark ? "bookmark.fill" : "bookmark")
                            .imageScale(.large)
                            .foregroundColor(tempJob.isBookmark ? .black : .gray)
                    } //: HStack
                    .padding()
                } //: Button
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.circle)
                .controlSize(.small)
                .tint(.black.opacity(0.08))
            } //: HStack
            .frame(height: 65)
            
            VStack(alignment: .leading) {
                CustomText(fontText: self.job.companyName, fontSize: 26)
//                    .frame(alignment: .topLeading)
                
                CustomText(fontText: self.job.designation, fontSize: 26)
                    .textCase(.uppercase)
                    .bold()
            }
            .padding(.vertical)
            
            CustomText(fontText: self.job.salary ?? "", fontSize: 20)
                .foregroundColor(.gray)

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
//            .background(.black)//(isTopCard ? .black : .white.opacity(0.7))
            .background(Color(hex: "#2B304E"))
            .clipShape(.capsule)
            
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
        .shadow(radius: 4)
        
    }
}


struct CardStackItem: View {
    let job: Job
    let index: Int
    let total: Int
    let onRemove: () -> Void
    
    @State private var offset = CGSize.zero
    
    var body: some View {
        JobCardView(job: job)
            .offset(y: CGFloat(index) * 15)
            .scaleEffect(1 - CGFloat(index) * 0.03)
            .zIndex(Double(total - index))
            .offset(offset)
            .gesture(
                index == 0 ?
                DragGesture()
                    .onChanged { gesture in
                        offset = gesture.translation
                    }
                    .onEnded { gesture in
                        if gesture.translation.height < -100 {
                            onRemove()
                        } else {
                            withAnimation {
                                offset = .zero
                            }
                        }
                    } : nil
            )
            .animation(.spring(), value: offset)
            
    }
}

struct StackedCardView: View {
    @State private var jobs: [Job] = Job.mockData
    
    var body: some View {
        ZStack {
            ForEach(jobs, id: \.id) { job in
                CardStackItem(job: job, index: jobs.firstIndex(where: { $0.id == job.id }) ?? 0, total: jobs.count) {
                    withAnimation {
                        if let index = jobs.firstIndex(where: { $0.id == job.id }) {
                            jobs.remove(at: index)
                        }
                    }
                }
            }
            .onDelete(perform: delete)
        }
        .padding(.horizontal)
    }
    
    func delete(at offsets: IndexSet) {
        withAnimation {
            jobs.remove(atOffsets: offsets)
        }
    }
    
}


#Preview {
//    JobCardsView()
    StackedCardView()
}
