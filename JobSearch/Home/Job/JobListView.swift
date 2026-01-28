//
//  JobListView.swift
//  JobSearch
//
//  Created by Walkar, Karan on 27/05/25.
//

import SwiftUI

//struct JobListView: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}

//struct JobCardView: View {
//    @Binding var job: Job
//    let isExpanded: Bool
//
//    var body: some View {
//        HStack(alignment: .top) {
//            job.logo
//                .resizable()
//                .frame(width: 40, height: 40)
//                .padding(.trailing, 8)
//
//            VStack(alignment: .leading, spacing: 6) {
//                Text(job.companyName)
//                    .font(.headline)
//                Text(job.designation)
//                    .font(.subheadline)
//                Text(job.salary ?? "")
//                    .font(.subheadline)
//                    .foregroundColor(.gray)
//            }
//
//            Spacer()
//
//            if isExpanded {
//                Image(systemName: "chevron.right")
//                    .foregroundColor(.gray)
//            }
//        }
//        .padding()
//        .frame(maxWidth: .infinity, alignment: .leading)
//        .background(Color(.systemGray6))
//        .cornerRadius(10)
//        .shadow(radius: 1)
//    }
//}

struct JobListView : View {
    var job: Job
    var body: some View {
        var tempJob = self.job
        VStack(alignment: .leading) {
            HStack {
                job.logo
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(.circle)
                
                VStack(alignment: .leading) {
                    Text(job.companyName).font(.headline)
                    Text(job.designation).font(.subheadline)
                    
                    Text(tempJob.salary ?? "")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
//                .frame(maxWidth: .infinity)
                Spacer()
                
            }
            
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
        .shadow(radius: 4)
    }
}


struct ListStackItem: View {
    let job: Job
//    let index: Int
//    let total: Int
//    let onRemove: () -> Void
//    
//    @State private var offset = CGSize.zero
    
    var body: some View {
        JobListView(job: job)
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
            
    }
}

struct ListView: View {
    @State private var jobs: [Job] = Job.mockData
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(jobs, id: \.id) { job in
                    //                ListStackItem(job: job, index: jobs.firstIndex(where: { $0.id == job.id }) ?? 0, total: jobs.count) {
                    //                    withAnimation {
                    //                        if let index = jobs.firstIndex(where: { $0.id == job.id }) {
                    //                            jobs.remove(at: index)
                    //                        }
                    //                    }
                    //                }
                    ListStackItem(job: job)
                }
                //            .onDelete(perform: delete)
            }
            //        .frame(maxWidth: .infinity)
            .padding(.horizontal)
            //        .scrollDisabled(true)
        }
    }
    
//    func delete(at offsets: IndexSet) {
//        withAnimation {
//            jobs.remove(atOffsets: offsets)
//        }
//    }
    
}

/*
struct JobListView: View {
//    @State private var jobs = sampleJobs
    @State private var jobs: [Job] = Job.mockData

    var body: some View {
        List() {
            ForEach($jobs) { $job in
//                JobCardView(job: job)
//                JobCardView(job: $job, isExpanded: true)
//                JobRowView(job: $job)
//                    .listRowInsets(EdgeInsets()) // Remove default insets
//                    .listRowSeparator(.visible) // Optional: hide row separators
//                    .background(Color.clear) // Remove row background
            }
        }
        .listStyle(PlainListStyle()) // Use plain style to flatten the list
        .background(Color.clear) // Remove list background
        .padding(8)
    }
}


struct JobRowView: View {
    @Binding var job: Job

    var body: some View {
        HStack {
//            Image(systemName: job.logo)
            job.logo
                .resizable()
                .frame(width: 40, height: 40)
//                .padding(.trailing, 8)
                .clipShape(Circle())
                .aspectRatio(1, contentMode: .fit)

            VStack(alignment: .leading) {
                Text(job.designation)
                    .font(.headline)
                Text(job.companyName)
                    .font(.subheadline)
                Text(job.salary ?? "")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()

            Button(action: {
                job.isBookmark.toggle()
            }) {
                Image(systemName: job.isBookmark ? "bookmark.fill" : "bookmark")
                    .foregroundColor(job.isBookmark ? .black : .gray)
            }

//            NavigationLink(destination: DetailsView(jobObj: job)) {
//                Image(systemName: "chevron.right")
//                    .foregroundColor(.gray)
//            }
        }
        .cornerRadius(10)
        .padding(.vertical, 8)
        
    }
}
*/

#Preview {
    ListView()
}
