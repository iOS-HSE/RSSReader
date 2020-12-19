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
    private var textArticle: String!

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.tableView.isScrollEnabled = true
        self.refreshControl?.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
//        self.navigationController?.navigationBar.tintColor = .white
//        self.navigationController?.navigationBar.backgroundColor = .red
        self.navigationController?.navigationBar.isTranslucent = false
        
//        self.navigationController?.navigationBar.isOpaque = false
        fillingTableGaps()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    @objc func refresh(sender:AnyObject)
    {
        fillingTableGaps()
        self.refreshControl?.endRefreshing()
    }
    
    private func fillingTableGaps()
    {
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        textArticle = self.articlesForTable.articleAtIndex(indexPath.row).hash
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "test") as! ArticleViewController
        Parsing(url: " ").getArticle(with: URL.api_page_url(hash: textArticle))
        { articles in
            vc.textArt = articles?.text ?? "Не удалось спарсить статью с сайта - вылез баннер. Попробуйте загрузить новость еще раз."
            DispatchQueue.main.async
            {
            self.navigationController?.pushViewController(vc,animated: true)
            }}
        }
    
}

