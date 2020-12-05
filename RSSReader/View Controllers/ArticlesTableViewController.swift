//
//  ArticlesTableViewController.swift
//  RSSReader
//
//  Created by Ignatovskiy Nikita on 05/12/2020.
//  Copyright © 2020 Ignatovskiy Nikita. All rights reserved.
//

import Foundation
import UIKit
import SafariServices


class ArticlesTableViewController: UITableViewController
{
    
    private var articlesForTable: ArticlesModel!
    private var textArticle: ArticleTextModel!

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.tableView.isScrollEnabled = true
        fillingTableGaps()
    }
    
    private func fillingTableGaps()
    {
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        Parsing(url: " ").getArticles(with: URL.api_news_url())
        { articles in
            if let articles = articles
            {
                self.articlesForTable = ArticlesModel(articles: articles)
                DispatchQueue.main.async
                {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int
    {
          return self.articlesForTable == nil ? 0 : self.articlesForTable.cellsAmount
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.articlesForTable.cellCapacity(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        guard let tableCell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else
        {
            fatalError("Error with TableView!")
        }
        
        let articleInCell = self.articlesForTable.articleAtIndex(indexPath.row)
        tableCell.fill(for: articleInCell)
        return tableCell
    }
}
