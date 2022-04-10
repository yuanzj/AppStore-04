//
//  AppStoreApp.swift
//  AppStore
//
//  Created by 袁志健 on 2022/3/6.
//

import SwiftUI

@main
struct AppStoreApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AppSettings())
        }
    }
}
