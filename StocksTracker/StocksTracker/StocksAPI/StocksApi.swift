//
//  StocksApi.swift
//  StocksTracker
//
//  Created by Rigoberto Saenz on 12/09/23.
//

import Foundation

class StocksApi {
  static func quotesShort(from symbols: [String]) async -> [StocksApiQuoteShort] {
    guard let data = await connect(to: .quoteShort(symbols: symbols)) else {
      return []
    }

    guard let result: [StocksApiQuoteShort] = decode(from: data) else {
      return []
    }

    return result
  }

  static func quotes(from symbols: [String]) async -> [StocksApiQuote] {
    guard let data = await connect(to: .quote(symbols: symbols)) else {
      return []
    }

    guard let result: [StocksApiQuote] = decode(from: data) else {
      return []
    }

    return result
  }

  static func priceChanges(from symbols: [String]) async -> [StocksApiPriceChange] {
    guard let data = await connect(to: .priceChange(symbols: symbols)) else {
      return []
    }

    guard let result: [StocksApiPriceChange] = decode(from: data) else {
      return []
    }

    return result
  }

  static func profiles(from symbols: [String]) async -> [StocksApiProfile] {
    guard let data = await connect(to: .profile(symbols: symbols)) else {
      return []
    }

    guard let result: [StocksApiProfile] = decode(from: data) else {
      return []
    }

    return result
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
