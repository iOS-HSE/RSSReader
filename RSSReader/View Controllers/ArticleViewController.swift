//
//  ArticleViewController.swift
//  RSSReader
//
//  Created by Ignatovskiy Nikita on 17.12.2020.
//  Copyright © 2020 Ignatovskiy Nikita. All rights reserved.
//

import Foundation
import UIKit


class ArticleViewController: UIViewController
{
    var textArt: String = ""

    @IBOutlet weak var textArticle: UITextView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        textArticle.text = textArt
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
}

