//
//  ContactSheetView.swift
//  JobSearch
//
//  Created by Chaitali Sawant on 06/02/26.
//

import SwiftUI

//struct ContactSheetView: View {
//
//    let profile: ProfileEntity?
//
//    var body: some View {
//        VStack(spacing: 16) {
//
//            if let phone = profile?.phone {
//                contactRow(icon: "phone.fill", text: phone) {
//                    UIApplication.shared.open(URL(string: "tel://\(phone)")!)
//                }
//            }
//
//            if let email = profile?.email {
//                contactRow(icon: "envelope.fill", text: email) {
//                    UIApplication.shared.open(URL(string: "mailto:\(email)")!)
//                }
//            }
//
//            if let linkedin = profile?.linkedin {
//                contactRow(icon: "link", text: "LinkedIn") {
//                    UIApplication.shared.open(URL(string: linkedin)!)
//                }
//            }
//
//            Spacer()
//        }
//        .padding()
//        .presentationDetents([.medium])
//    }
//
//    private func contactRow(icon: String, text: String, action: @escaping () -> Void) -> some View {
//        Button(action: action) {
//            HStack {
//                Image(systemName: icon)
//                Text(text)
//                Spacer()
//            }
//        }
//    }
//}

//struct ContactSheetView: View {
//
//    let profile: ProfileUIModel?
//
//    var body: some View {
//        VStack(spacing: 16) {
//
//            contact("Phone", profile?.phone, "tel://")
//            contact("Email", profile?.email, "mailto:")
//
//            Spacer()
//        }
//        .padding()
//        .presentationDetents([.medium])
//    }
//
//    private func contact(
//        _ title: String,
//        _ value: String?,
//        _ scheme: String
//    ) -> some View {
//        guard let value else { return AnyView(EmptyView()) }
//
//        return AnyView(
//            Button {
//                UIApplication.shared.open(URL(string: "\(scheme)\(value)")!)
//            } label: {
//                HStack {
//                    Text(title)
//                    Spacer()
//                    Text(value)
//                }
//            }
//        )
//    }
//}

struct ContactSheetView: View {

    let profile: ProfileUIModel?

    var body: some View {
        VStack(spacing: 20) {

            Text("Contact")
                .font(.title2.bold())
                .foregroundColor(.white)

            if let phone = profile?.phone {
                contactRow(
                    icon: "phone.fill",
                    title: "Phone",
                    value: phone,
                    url: "tel://\(phone)"
                )
            }

            if let email = profile?.email {
                contactRow(
                    icon: "envelope.fill",
                    title: "Email",
                    value: email,
                    url: "mailto:\(email)"
                )
            }

            if let linkedin = profile?.linkedin {
                contactRow(
                    icon: "link",
                    title: "LinkedIn",
                    value: linkedin,
                    url: linkedin
                )
            }

            if let github = profile?.github {
                contactRow(
                    icon: "chevron.left.slash.chevron.right",
                    title: "GitHub",
                    value: github,
                    url: github
                )
            }

            if profile == nil {
                Text("No contact details available")
                    .foregroundColor(.secondary)
            }

            Spacer()
        }
        .padding()
        .presentationDetents([.medium])
        .background(CustomBackground())
    }

    private func contactRow(
        icon: String,
        title: String,
        value: String,
        url: String
    ) -> some View {
        Button {
            if let url = URL(string: url) {
                UIApplication.shared.open(url)
            }
        } label: {
            HStack(spacing: 12) {
                Image(systemName: icon)
                VStack(alignment: .leading) {
                    Text(title).font(.caption)
                    Text(value).font(.body)
                }
                Spacer()
                Image(systemName: "chevron.right")
//                    .foregroundColor(.white)
            }
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(14)
        }
        .foregroundColor(.white)
    }
}


#Preview {
    ContactSheetView(profile: ProfileView.mockProfile)
}
