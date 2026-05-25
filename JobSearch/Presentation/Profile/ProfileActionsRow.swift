//
//  ProfileActionsRow.swift
//  JobSearch
//
//  Created by Chaitali Sawant on 29/01/26.
//

import Foundation
import SwiftUI

struct ProfileActionButtons: View {

    let cvSize: String
    let onUploadCV: () -> Void
    @StateObject private var viewModel = ProfileViewModel()
    
    var body: some View {
        HStack(spacing: 12) {

            Button(action: onUploadCV) {
                Text("CV • \(cvSize)")
                    .font(.subheadline.bold())
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(16)
            }

            Button {
                viewModel.showContactSheet = true
            } label: {
//                Label("Contact", systemImage: "phone.fill")
                Text("Contact")
                    .font(.subheadline.bold())
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.gray.opacity(0.15))
                    .cornerRadius(16)
            }
            .sheet(isPresented: $viewModel.showContactSheet) {
                ContactSheetView(profile: ProfileView.mockProfile)
            }

        }
    }
}


//struct ProfileActionsRow: View {
//
//    let cvSize: String
//    let onUploadCV: () -> Void
//    let onContact: () -> Void
//
//    var body: some View {
//        HStack(spacing: 16) {
//
//            ActionButton(
//                title: "CV • \(cvSize)",
//                action: onUploadCV
//            )
//
//            ActionButton(
//                title: "Contact",
//                action: onContact
//            )
//        }
//    }
//}
//
//struct ActionButton: View {
//
//    let title: String
//    let action: () -> Void   // ✅ closure, NOT Binding
//
//    var body: some View {
//        Button(action: action) {
//            Text(title)
//                .font(.subheadline.bold())
//                .foregroundColor(.white)
//                .frame(maxWidth: .infinity)
//                .padding()
//                .background(Color.black)
//                .cornerRadius(14)
//        }
//    }
//}

#Preview {
    ProfileActionButtons(cvSize: "2.3 mb", onUploadCV: {
        
    })
        
}
