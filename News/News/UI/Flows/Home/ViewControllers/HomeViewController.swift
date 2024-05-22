//
//  HomeViewController.swift
//  News
//
//  Created by Galina Savenko on 10.04.2024.
//

import UIKit

class HomeViewController: UIViewController {
   private let themeKey = "theme"

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let theme = SettingsManager.shared.loadSelectedTheme()
        view.backgroundColor = theme.bgColor
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
