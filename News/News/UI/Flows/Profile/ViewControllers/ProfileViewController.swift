//
//  ProfileViewController.swift
//  News
//
//  Created by Galina Savenko on 10.04.2024.
//

import UIKit

class ProfileViewController: UIViewController {
    private let settingsManager = SettingsManager.shared
    
    @IBOutlet weak var themeSegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupThemeSegment()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let theme = settingsManager.loadSelectedTheme()
        view.backgroundColor = theme.bgColor
        themeSegment.selectedSegmentIndex = theme.themesIndex
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func onThemeChanged(_ sender: Any) {
        var newTheme = Theme.getTheme(by: themeSegment.selectedSegmentIndex)
        settingsManager.saveTheme(theme: newTheme)
    }
    
    private func setupThemeSegment() {
        themeSegment.removeAllSegments()
        
        Theme.allCases.forEach { theme in
            if theme != .none  {
                themeSegment.insertSegment(withTitle: theme.title, at: theme.themesIndex, animated: true)
            }
        }
    }
}
