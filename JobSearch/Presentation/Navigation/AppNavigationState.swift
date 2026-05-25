//
//  AppNavigationState.swift
//  JobSearch
//
//  Created by Chaitali Sawant on 28/01/26.
//

import Foundation
import SwiftUI

final class AppNavigationState: ObservableObject {
    @Published var path = NavigationPath()
}
