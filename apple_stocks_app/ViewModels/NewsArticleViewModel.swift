//
//  NewsArticleViewModel.swift
//  apple_stocks_app
//
//  Created by Erluan Felix Batista on 02/03/22.
//

import Foundation


struct NewsArticleViewModel {
    let article: Article
    
    var imageURL: String {
        return self.article.imageURL
    }
    
    var title: String {
        return self.article.title
    }
    
    var publication: String {
        return self.article.publication.uppercased()
    }
}
