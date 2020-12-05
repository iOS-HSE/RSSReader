//
//  URL+Extensions.swift
//  RSSReader
//
//  Created by Ignatovskiy Nikita on 05/12/2020.
//  Copyright © 2020 Ignatovskiy Nikita. All rights reserved.
//

import Foundation
import UIKit

extension URL
{
    static func api_news_url() -> URL
    {
        return URL(string: Constants.api_news_getting)!
    }
}
