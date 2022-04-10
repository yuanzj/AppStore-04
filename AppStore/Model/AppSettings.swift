//
//  AppSettings.swift
//  AppStore
//
//  Created by 袁志健 on 2022/4/5.
//

import SwiftUI

//MARK: - Theme Settings
class AppSettings: ObservableObject {
    
    @Published var accentColorSettings: Int = UserDefaults.standard.integer(forKey: "accentColor") {
        didSet {
            UserDefaults.standard.set(self.accentColorSettings, forKey: "accentColor")
        }
    }
    
    @Published var darkModeSettings: Int = UserDefaults.standard.integer(forKey: "darkMode") {
        didSet {
            UserDefaults.standard.set(self.darkModeSettings, forKey: "darkMode")
            
            let scenes = UIApplication.shared.connectedScenes
            let windowScene = scenes.first as? UIWindowScene
            let window = windowScene?.windows.first
            switch self.darkModeSettings {
            case 0:
                window?.overrideUserInterfaceStyle = .unspecified
            case 1:
                window?.overrideUserInterfaceStyle = .light
            case 2:
                window?.overrideUserInterfaceStyle = .dark
            default:
                window?.overrideUserInterfaceStyle = .unspecified
            }
        }
    }
    
    @Published var appIconSettings: Int = UserDefaults.standard.integer(forKey: "appIcon") {
        didSet {
            UserDefaults.standard.set(self.appIconSettings, forKey: "appIcon")
            UIApplication.shared.setAlternateIconName(self.appIconSettings == 0 ? nil : "app_\(appIconNames[self.appIconSettings])" )
        }
    }
}
