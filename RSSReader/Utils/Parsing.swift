//
//  Parsing.swift
//  RSSReader
//
//  Created by Ignatovskiy Nikita on 05/12/2020.
//  Copyright © 2020 Ignatovskiy Nikita. All rights reserved.
//

import Foundation

class Parsing
{
    var url: String
    
    init(url: String)
    {
        self.url = url
    }
    
    
    func getArticles(with url: URL, completion: @escaping ([Article]?) -> ())
    {
        
        URLSession.shared.dataTask(with: url)
        { data, response, error in
            if let error = error
            {
                print(error.localizedDescription)
                completion(nil)
            }
            else if let data = data
            {
                let articlesList = (try! JSONDecoder().decode(Array<Article>.self, from: data))
                completion(articlesList)

            }
            
        }.resume()
        
    }
    
    func getArticle(with url: URL, completion: @escaping (ArticleText?) -> ())
    {
        
        URLSession.shared.dataTask(with: url)
        { data, response, error in
            if let error = error
            {
                print(error.localizedDescription)
                completion(nil)
            }
            else if let data = data
            {
                let articlesList = (try? JSONDecoder().decode(ArticleText.self, from: data))
                completion(articlesList)

            }
            
        }.resume()
        
    }
    
}
