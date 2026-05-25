//
//  JobCardsView.swift
//  JobSearch
//
//  Created by Walkar, Karan on 21/03/25.
//

import SwiftUI
/*
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
*/

struct JobCardView: View {
//    var job: Job
    let job: JobUIModel
    
    var body: some View {
//        var tempJob = self.job
        VStack(alignment: .leading) {
            HStack {
                job.logo?
                    .resizable()
                    .clipShape(Circle())
//                  .border(.black, width: 1)
                    .aspectRatio(1, contentMode: .fit)
                
                Spacer()
                
                Button(action: {
//                    job.isBookmark.toggle()
                }) {
                    HStack {
                        Image(systemName: job.isBookmark ? "bookmark.fill" : "bookmark")
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
            .frame(height: 65)
            
            VStack(alignment: .leading) {
                CustomText(fontText: job.companyName, fontSize: 26)
                    .padding(.vertical)
//                    .frame(alignment: .topLeading)
                
                CustomText(fontText: job.designation, fontSize: 26)
                    .textCase(.uppercase)
                    .bold()
            }
            .padding(.vertical)
            
            CustomText(fontText: job.salary ?? "", fontSize: 20)
                .foregroundColor(.gray)
                .padding(.vertical)

//            Spacer()
            
//            NavigationLink(destination: DetailsView(jobObj: job)
//              .navigationBarHidden(true)
//            ) {
//                CustomText(fontText: "See Details", fontSize: 20)
//                    .fontWeight(.bold)
//                    .foregroundColor(.white)
//                    .padding()
//                
//            } //: NavigationLink
//            .frame(maxWidth: .infinity)
////            .background(.black)//(isTopCard ? .black : .white.opacity(0.7))
//            .background(Color(hex: "#2B304E"))
//            .clipShape(.capsule)
            
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
        .shadow(radius: 4)
        
    }
}


//struct CardStackItem: View {
////    let job: Job
//    let job: JobUIModel
//    let index: Int
//    let total: Int
//    let onRemove: () -> Void
//    
//    @State private var offset = CGSize.zero
//    
//    var body: some View {
//        JobCardView(job: job)
//            .offset(y: CGFloat(index) * 15)
//            .scaleEffect(1 - CGFloat(index) * 0.03)
//            .zIndex(Double(total - index))
//            .offset(offset)
//            .gesture(
//                index == 0 ?
//                DragGesture()
//                    .onChanged { gesture in
//                        offset = gesture.translation
//                    }
//                    .onEnded { gesture in
//                        if gesture.translation.height < -100 {
//                            onRemove()
//                        } else {
//                            withAnimation {
//                                offset = .zero
//                            }
//                        }
//                    } : nil
//            )
//            .animation(.spring(), value: offset)
//            
//    }
//}

//struct StackedCardView: View {
////    @State private var jobs: [JobUIModel] = JobUIModel.mockData
////    let job: JobUIModel
//    @StateObject var viewModel: HomeViewModel
//    
//    var body: some View {
//        ZStack {
////            ForEach(jobs, id: \.id) { job in
////                CardStackItem(job: job, index: jobs.firstIndex(where: { $0.id == job.id }) ?? 0, total: jobs.count) {
////            withAnimation {
////                if let index = jobs.firstIndex(where: { $0.id == job.id }) {
////                    jobs.remove(at: index)
////                }
////            }
//            ForEach(viewModel.jobs.indices, id: \.self) { index in
//                CardStackItem(job: viewModel.jobs[index], index: index, total: viewModel.jobs.count) {
//                    viewModel.jobs.remove(at: index)
//                }
//            }
//            .onDelete(perform: delete)
//        }
//        .padding(.horizontal)
//    }
//    
//    func delete(at offsets: IndexSet) {
//        withAnimation {
//            viewModel.jobs.remove(atOffsets: offsets)
//        }
//    }
//    
//}


#Preview {
    JobCardView(job: JobUIModel.preview)
//    StackedCardView()
}
