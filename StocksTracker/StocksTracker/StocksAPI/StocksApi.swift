//
//  StocksApi.swift
//  StocksTracker
//
//  Created by Rigoberto Saenz on 12/09/23.
//

import Foundation

class StocksApi {
  static func quoteShort(for symbol: String) async -> StocksApiQuoteShort {
    guard let data = await connect(to: .quoteShort(symbols: [symbol])),
          let results: [StocksApiQuoteShort] = decode(from: data),
          let quoteShort = results.first else {
      return StocksApiQuoteShort(symbol: symbol)
    }

    return quoteShort
  }

  static func quote(for symbol: String) async -> StocksApiQuote {
    guard let data = await connect(to: .quote(symbols: [symbol])),
          let results: [StocksApiQuote] = decode(from: data),
          let quote = results.first else {
      return StocksApiQuote(symbol: symbol)
    }

    return quote
  }

  static func priceChanges(for symbol: String) async -> StocksApiPriceChange {
    guard let data = await connect(to: .priceChange(symbols: [symbol])),
          let results: [StocksApiPriceChange] = decode(from: data),
          let priceChanges = results.first else {
      return StocksApiPriceChange(symbol: symbol)
    }

    return priceChanges
  }

  static func profile(for symbol: String) async -> StocksApiProfile {
    guard let data = await connect(to: .profile(symbols: [symbol])),
          let results: [StocksApiProfile] = decode(from: data),
          let profile = results.first else {
      return StocksApiProfile(symbol: symbol)
    }

    return profile
  }
}

extension StocksApi {
  private static func connect(to endpoint: StocksApiEndpoint) async -> Data? {
    do {
      let result = try await URLSession.shared.data(from: endpoint.url)
      return result.0
    }
    catch {
      return nil
    }
  }

  private static func decode<T: Codable>(from data: Data) -> T? {
    do {
      return try JSONDecoder().decode(T.self, from: data)
    }
    catch {
      return nil
    }
  }
}

