//
//  Webservice.swift
//  stockOptions
//
//  Created by Luiz Gabriel Rebelatto Bianchi on 24/06/23.
//

import Foundation

enum StockError: Error {
    case invalidServerResponse
}

class Webservice {
    func getStocks(url: URL) async throws -> [Stock] {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let HttpResponse = response as? HTTPURLResponse,
              HttpResponse.statusCode == 200 else {
                throw StockError.invalidServerResponse
              }
        return try JSONDecoder().decode([Stock].self, from: data)
    }
}
