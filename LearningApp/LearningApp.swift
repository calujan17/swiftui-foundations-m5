//
//  LearningAppApp.swift
//  LearningApp
//
//  Created by Casey Lujan on 7/5/21.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView().environmentObject(ContentModel())
        }
    }
}
