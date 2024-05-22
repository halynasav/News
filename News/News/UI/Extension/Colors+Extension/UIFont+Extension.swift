//
//  UIFont+Extension.swift
//  News
//
//  Created by Galina Savenko on 29.04.2024.
//

import UIKit

extension UIFont {
    static var appHeaderTitle: UIFont {
        UIFont.boldSystemFont(ofSize: 18)
    }
    
    static var appButtonTitleFont: UIFont {
        UIFont.boldSystemFont(ofSize: 14)
    }
    
    static var appSecondTitleFont: UIFont {
        UIFont.systemFont(ofSize: 14, weight: .medium)
    }

    static var appTextFont: UIFont {
        UIFont.systemFont(ofSize: 12, weight: .light)
    }


}
