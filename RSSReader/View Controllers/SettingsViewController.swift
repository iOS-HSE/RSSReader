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

    @IBOutlet weak var fontSizeSlider: UISlider!
    @IBOutlet weak var fontSizeLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fontSizeSlider.minimumValue = 12
        fontSizeSlider.maximumValue = 24
        
        fontSizeLable.text = "Шрифт: \(fontSize)"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func fonsSizeSliderValueChanged(_ sender: UISlider) {
        fontSize = Int(sender.value)
        fontSizeLable.text = "Шрифт: \(fontSize)"
    }
    
    @IBAction func themeSwitchTriggered(_ sender: UISwitch) {
        
    }
    @IBAction func signOutButtonPressed(_ sender: UIButton) {
        
    }
    

}
