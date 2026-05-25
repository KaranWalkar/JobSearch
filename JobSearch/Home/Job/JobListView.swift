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
/*
struct JobListView : View {
    var job: JobUIModel
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
    let job: JobUIModel
    
    var body: some View {
        JobListView(job: job)
    }
}

struct ListView: View {
    @State private var jobs: [Job] = Job.mockData
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(jobs, id: \.id) { job in
                    ListStackItem(job: job)
                }
                //            .onDelete(perform: delete)
            }
            .padding(.horizontal)
        }
    }
    
//    func delete(at offsets: IndexSet) {
//        withAnimation {
//            jobs.remove(atOffsets: offsets)
//        }
//    }
    
}
 
#Preview {
    ListView()
}
 */
