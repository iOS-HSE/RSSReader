//
//  Article.swift
//  RSSReader
//
//  Created by Ignatovskiy Nikita on 05/12/2020.
//  Copyright © 2020 Ignatovskiy Nikita. All rights reserved.
//

import Foundation

struct ArticleList: Codable
{
    let articles: [Article]
}

struct Article: Codable
{
    let title: String
    let media: String
    let published: String
    let link: String
}

struct ArticleText: Codable
{
    let text: String
}


