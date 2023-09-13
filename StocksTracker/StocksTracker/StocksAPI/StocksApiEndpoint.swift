//
//  StocksApiEndpoint.swift
//  StocksTracker
//
//  Created by Rigoberto Saenz on 12/09/23.
//

import Foundation

private let apiKey = ""
private let baseURL = "https://financialmodelingprep.com/api/v3"

/**
 https://site.financialmodelingprep.com/developer/docs
 */
enum StocksApiEndpoint {
  case quoteShort(symbols: [String])
  case quote(symbols: [String])
  case priceChange(symbols: [String])
  case profile(symbols: [String])
}

extension StocksApiEndpoint {
  var url: URL {
    switch self {
    case let .quoteShort(symbols),
         let .quote(symbols),
         let .priceChange(symbols),
         let .profile(symbols):
      return URL(string: "\(baseURL)/\(endpointURL)/\(joined(symbols))?apikey=\(apiKey)")!
    }
  }

  private var endpointURL: String {
    switch self {
    case .quoteShort:
      return "quote-short"

    case .quote:
      return "quote"

    case .priceChange:
      return "stock-price-change"

    case .profile:
      return "profile"
    }
  }

  private func joined(_ symbols: [String]) -> String {
    symbols
      .map { $0.uppercased() }
      .joined(separator: ",")
  }
}
