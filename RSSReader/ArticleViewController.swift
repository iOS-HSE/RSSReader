//
//  ArticleViewController.swift
//  RSSReader
//
//  Created by Ignatovskiy Nikita on 05/12/2020.
//  Copyright © 2020 Ignatovskiy Nikita. All rights reserved.
//

import Foundation
import UIKit


class ArticleViewController: UIViewController
{
    var textValue: String = " "
    var titleValue: String = " "
    @IBOutlet weak var textArticle: UITextView!
    @IBOutlet weak var titleBar: UINavigationItem!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        textArticle.text = textValue
        titleBar.title = titleValue
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    
    
}

