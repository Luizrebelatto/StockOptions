//
//  Stock.swift
//  stockOptions
//
//  Created by Luiz Gabriel Rebelatto Bianchi on 25/06/23.
//

import Foundation

struct Stock: Decodable {
    let symbol: String
    let description: String
    let price: Double
}
