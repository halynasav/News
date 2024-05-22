//
//  SettingsManager.swift
//  News
//
//  Created by Test on 22.05.2024.
//

import UIKit

enum Theme: CaseIterable {
    case dark
    case light
    case green
    case none
    
    var themesIndex: Int {
        switch self {
        case .dark:
            0
        case .light:
            1
        case .green:
            2
        case .none:
            0
        }
    }
    
    var title: String {
        switch self {
        case .dark, .none:
            "Dark"
        case .light:
           "Light"
        case .green:
            "Green"
        }
    }
    
    var bgColor: UIColor {
        switch self {
        case .dark:
                .black
        case .light:
                .white
        case .green:
                .green
        case .none:
                .black
        }
    }
    
   static func getTheme(by index: Int) -> Theme {
        switch index {
        case 0:
                .dark
        case 1:
                .light
        case 2:
                .green
        default: .none
        }
    }
}

final class SettingsManager {
    enum SettingsKey: String {
        case theme = "themeKey"
    }
    
    static let shared = SettingsManager()
    
    func loadSelectedTheme() -> Theme {
        let themeInt = UserDefaults.standard.integer(forKey: SettingsKey.theme.rawValue)
        return .getTheme(by: themeInt)
    }
    
    func saveTheme(theme: Theme) {
        UserDefaults.standard.setValue(theme.themesIndex, forKey: SettingsKey.theme.rawValue)
    }
}

