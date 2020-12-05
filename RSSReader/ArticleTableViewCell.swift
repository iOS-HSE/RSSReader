//
//  ArticleTableViewCell.swift
//  RSSReader
//
//  Created by Ignatovskiy Nikita on 05/12/2020.
//  Copyright © 2020 Ignatovskiy Nikita. All rights reserved.
//

import Foundation
import UIKit

class ArticleTableViewCell: UITableViewCell
{
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func fill(for article: ArticleViewModel)
    {
        self.titleLabel.text = article.title
        self.descriptionLabel.text = article.description 
    }
    
}
