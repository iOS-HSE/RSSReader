//
//  SettingsViewController.swift
//  RSSReader
//
//  Created by Олеся Мартынюк on 18.12.2020.
//  Copyright © 2020 Olesia Martinyuk. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {
    
    var fontSize: Int {
        get {
            UserDefaults.standard.integer(forKey: "fontSize")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "fontSize")
        }
    }

    @IBOutlet weak var themeLabel: UILabel!
    @IBOutlet weak var fontSizeSlider: UISlider!
    @IBOutlet weak var fontSizeLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fontSizeSlider.minimumValue = 12
        fontSizeSlider.maximumValue = 24
        fontSizeSlider.value = Float(fontSize)
        fontSizeLable.font = fontSizeLable.font.withSize(CGFloat(fontSize))
        themeLabel.font = themeLabel.font.withSize(CGFloat(fontSize))
        fontSizeLable.text = "Шрифт: \(fontSize)"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func fonsSizeSliderValueChanged(_ sender: UISlider) {
        fontSize = Int(sender.value)
        fontSizeLable.text = "Шрифт: \(fontSize)"
        fontSizeLable.font = fontSizeLable.font.withSize(CGFloat(fontSize))
        themeLabel.font = themeLabel.font.withSize(CGFloat(fontSize))
    }
    
    @IBAction func themeSwitchTriggered(_ sender: UISwitch) {
        let isLightTheme = sender.isOn
        UserDefaults.standard.set(isLightTheme, forKey: "isLightTheme")
        let theme: UIUserInterfaceStyle = isLightTheme ? .light : .dark
        (view.window?.windowScene?.delegate as? SceneDelegate)?.changeTheme(to: theme)
    }
    @IBAction func signOutButtonPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyboard.instantiateViewController(identifier: "AuthViewController") as! AuthViewController
        self.view.window?.rootViewController = secondVC
    }
    

}
