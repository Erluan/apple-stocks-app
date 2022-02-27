//
//  Stock.swift
//  apple_stocks_app
//
//  Created by Erluan Felix Batista on 27/02/22.
//

import Foundation

struct Stock: Decodable {
    let symbol: String
    let description: String
    let price: Double
    let change: String
}
