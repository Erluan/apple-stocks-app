//
//  StockListViewModel.swift
//  apple_stocks_app
//
//  Created by Erluan Felix Batista on 27/02/22.
//

import Foundation
import SwiftUI

class StockListViewModel: ObservableObject {
    
    @Published var dragOffset: CGSize = CGSize(width: 0, height: 600)
    @Published var searchTerm: String = ""
    @Published var stocks: [StockViewModel] = [StockViewModel]()
    @Published var news: [NewsArticleViewModel] = [NewsArticleViewModel]()
    
    func load() {
        fetchNews()
        fetchStocks()
    }
    
    private func fetchNews() {
        WebService().getTopNews { news in
            
            if let news = news {
                self.news = news.map(NewsArticleViewModel.init)
            }
            
        }
    }
    
    private func fetchStocks() {
        
        WebService().getStocks{ stocks in
            if let stocks = stocks {
                DispatchQueue.main.async {
                    self.stocks = stocks.map(StockViewModel.init)
                }
            }
        }
        
    }
    
}
