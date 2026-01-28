//
//  ResumeDetailView.swift
//  JobSearch
//
//  Created by Walkar, Karan on 24/07/25.
//

import SwiftUI
#if os(iOS)
import UIKit
#endif

struct ResumeDetailView: View {
    
    @Bindable var resume: Resume
    
    @State private var isEmailValid = true
    @State private var isPhoneValid = true
    @State private var errorMessage = ""
    
    var isEditable: Bool = true
    var headerColor: Color = .gray // default color

    var body: some View {
        Form {
            if isEditable {
                Section {
                    ResumeUploadView()
                }
            }
            
            Section(header: Text("Basic Info")
                .foregroundColor(headerColor)) {
                TextField("Name", text: $resume.name ?? "")
                    .applyAutocapitalizationWords()
                    .applyDisableAutocorrection(true)
                    .disabled(!isEditable)

                TextField("Email", text: $resume.email)
                    .applyEmailKeyboard()
                    .applyAutocapitalizationNever()
                    .applyDisableAutocorrection(true)
                    .disabled(!isEditable)
                    .onChange(of: resume.email) { newEmail in
                        validateEmail()
                    }
                if !isEmailValid {
                    Text("Invalid email format")
                        .foregroundColor(.red)
                        .font(.footnote)
                }

                TextField("Phone", text: $resume.phone)
                    .applyPhoneKeyboard()
                    .disabled(!isEditable)
                    .onChange(of: resume.phone) { newPhone in
                        validatePhone()
                    }
                
                if !isPhoneValid {
                    Text("Invalid phone number format")
                        .foregroundColor(.red)
                        .font(.footnote)
                }
            }
            
//            Section(header: Text("Education")
//                .foregroundColor(headerColor)) {
//                ForEach($resume.education, id: \.self) { $education in
//                    TextField("Education", text: $education)
//                        .disabled(!isEditable)
//                }
//                .onDelete(perform: deleteEducation)
//                if isEditable {
//                    Button("Add Education") {
//                        resume.education.append("")
//                    }
//                }
//            }
//
//            Section(header: Text("Experience")
//                .foregroundColor(headerColor)) {
//                ForEach($resume.experience, id: \.self) { $experience in
//                    TextEditor(text: $experience)
//                        .frame(height: 80)
//                        .border(Color.gray, width: 1)
//                        .padding(.vertical, 4)
//                        .disabled(!isEditable)
//                }
//                .onDelete(perform: deleteExperience)
//                if isEditable {
//                    Button("Add Experience") {
//                        resume.experience.append("")
//                    }
//                }
//            }
//
//            Section(header: Text("Skills")
//                .foregroundColor(headerColor)) {
//                ForEach($resume.skills, id: \.self) { $skill in
//                    TextField("Skill", text: $skill)
//                        .disabled(!isEditable)
//                }
//                .onDelete(perform: deleteSkills)
//                if isEditable {
//                    Button("Add Skill") {
//                        resume.skills.append("")
//                    }
//                }
//            }

            if isEditable {
                Section {
                    Button(action: {
                        // Handle apply now action
                        saveResume()
                    }) {
                        CustomText(fontText: "Save Resume", fontSize: 18)
                            .bold()
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.white)
                            .foregroundColor(Color(hex: "#2B304E"))
                            .cornerRadius(15)
                    }
                    .clipShape(.capsule)
                    .padding([.horizontal])
                    .disabled(!isEmailValid || !isPhoneValid)
                    .listRowBackground(Color.clear)
                }
            }
            
        }
        #if os(iOS)
        .listSectionSpacing(0)
        .scrollBounceBehavior(.basedOnSize)
        #endif
    }

    // Validation methods
    private func validateEmail() {
        let emailPattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        isEmailValid = resume.email?.range(of: emailPattern, options: .regularExpression) != nil
    }

    private func validatePhone() {
        let phonePattern = "(\\+\\d{1,2}\\s?)?\\(?\\d{3}\\)?[\\s.-]?\\d{3}[\\s.-]?\\d{4}"
        isPhoneValid = resume.phone?.range(of: phonePattern, options: .regularExpression) != nil
    }

//    private func deleteEducation(at offsets: IndexSet) {
//        resume.education.remove(atOffsets: offsets)
//    }
//
//    private func deleteExperience(at offsets: IndexSet) {
//        resume.experience.remove(atOffsets: offsets)
//    }
//
//    private func deleteSkills(at offsets: IndexSet) {
//        resume.skills.remove(atOffsets: offsets)
//    }

    private func saveResume() {
        // Save the resume to a file or local storage. For example, save to JSON.
//        do {
//            let encoder = JSONEncoder()
//            let data = try encoder.encode(resume)
//            let url = FileManager.default.temporaryDirectory.appendingPathComponent("resume.json")
//            try data.write(to: url)
//            print("Resume saved to \(url)")
//        } catch {
//            print("Failed to save resume: \(error.localizedDescription)")
//        }
    }
}

private extension View {
    // Apply word capitalization for name field with backward compatibility
    func applyAutocapitalizationWords() -> some View {
        #if os(iOS)
        if #available(iOS 15.0, *) {
            return AnyView(self.textInputAutocapitalization(.words))
        } else {
            return AnyView(self.autocapitalization(.words))
        }
        #else
        return AnyView(self)
        #endif
    }
    
    // Apply no capitalization for email field with backward compatibility
    func applyAutocapitalizationNever() -> some View {
        #if os(iOS)
        if #available(iOS 15.0, *) {
            return AnyView(self.textInputAutocapitalization(.never))
        } else {
            return AnyView(self.autocapitalization(.none))
        }
        #else
        return AnyView(self)
        #endif
    }
    
    // Disable autocorrection with broad compatibility
    func applyDisableAutocorrection(_ disabled: Bool) -> some View {
        if #available(iOS 15.0, macOS 12.0, *) {
            return self.disableAutocorrection(disabled)
        } else {
            // Older SwiftUI also has disableAutocorrection(_:), keep the same call
            return self.disableAutocorrection(disabled)
        }
    }
    
    // Cross-platform keyboard helpers: only active on iOS
    func applyEmailKeyboard() -> some View {
        #if os(iOS)
        return AnyView(self.keyboardType(.emailAddress))
        #else
        return AnyView(self)
        #endif
    }
    
    func applyPhoneKeyboard() -> some View {
        #if os(iOS)
        return AnyView(self.keyboardType(.phonePad))
        #else
        return AnyView(self)
        #endif
    }
}

struct ResumeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
//            ResumeDetailView(resume: .constant(Resume(name: "John Doe", email: "johndoe@example.com", phone: "+1234567890", education: ["B.Sc. in Computer Science"], experience: ["Software Developer at XYZ Corp"], skills: ["Swift", "iOS", "Objective-C"])))
        }
    }
}
