//
//  ArticlesModel.swift
//  RSSReader
//
//  Created by Ignatovskiy Nikita on 05/12/2020.
//  Copyright © 2020 Ignatovskiy Nikita. All rights reserved.
//

import Foundation

struct ArticlesModel
{
    let articles: [Article]
}

extension ArticlesModel
{
    
    var cellsAmount: Int
    {
        return 1
    }
    
    func cellCapacity(_ section: Int) -> Int
    {
        return self.articles.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel
    {
        let article = articles[index]
        return ArticleViewModel(article)
    }
    
}

struct ArticleViewModel
{
    private let article: Article
}

extension ArticleViewModel
{
    init(_ article: Article)
    {
        self.article = article
    }
}

extension ArticleViewModel
{
    
    var title: String
    {
        return self.article.title
    }
    
    var description: String
    {
        return self.article.published + " | " + self.article.media
    }
    var hash: String
    {
        return self.article.hash
    }
}


struct ArticleTextModel
{
    private let textArticle: ArticleText
}

extension ArticleTextModel
{
    init(_ articletext: ArticleText)
    {
        self.textArticle = articletext
    }
}

extension ArticleTextModel
{
    var text: String
    {
        return self.textArticle.text
    }
}

