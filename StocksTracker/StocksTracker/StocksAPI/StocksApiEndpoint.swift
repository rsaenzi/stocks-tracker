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
  case quote(symbols: [String])
  case stockPriceChange(symbols: [String])
  case quoteShort(symbols: [String])
  case profile(symbols: [String])
}

extension StocksApiEndpoint {
  var url: URL {
    switch self {
    case let .quote(symbols),
      let .stockPriceChange(symbols),
      let .quoteShort(symbols),
      let .profile(symbols):
      return URL(string: "\(baseURL)/\(endpointURL)/\(joined(symbols))?apikey=\(apiKey)")!
    }
  }

  private var endpointURL: String {
    switch self {
    case .quote:
      return "quote"

    case .stockPriceChange:
      return "stock-price-change"

    case .quoteShort:
      return "quote-short"

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
