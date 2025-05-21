//
//  ContentView.swift
//  JobSearch
//
//  Created by Walkar, Karan on 17/03/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
//        if let image = UIImage(named: "back-button") {
//            UINavigationBar.appearance().backIndicatorImage = image
//            UINavigationBar.appearance().backIndicatorTransitionMaskImage = image
//        }
        NavigationView {
            HomeView()
        }
//        .navigationViewStyle(.stack)
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    } 

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
