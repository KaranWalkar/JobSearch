//
//  ProfileHeaderView.swift
//  JobSearch
//
//  Created by Chaitali Sawant on 29/01/26.
//

import Foundation
import SwiftUI

struct ProfileHeaderView: View {

    var body: some View {
        VStack {
            HStack {
                Text("My profile")
                    .font(.title.bold())
                    .foregroundColor(.white)

                Spacer()

                Image(systemName: "pencil")
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color.white.opacity(0.2))
                    .clipShape(Circle())
            }
            .padding(.horizontal)
            .padding(.top, 16)

            Spacer()
        }
        .frame(height: 220)
//        .background(
//            LinearGradient(
//                colors: [Color.blue, Color.indigo],
//                startPoint: .topLeading,
//                endPoint: .bottomTrailing
//            )
//        )
    }
}

/*
struct ProfileHeaderView: View {

    var body: some View {
        HStack {
            Text("My profile")
                .font(.largeTitle.bold())
                .foregroundColor(.white)

            Spacer()

            Image(systemName: "pencil")
                .foregroundColor(.white)
                .padding()
                .background(Circle().fill(Color.white.opacity(0.2)))
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            LinearGradient(
                colors: [.blue, .indigo],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
    }
}
*/
