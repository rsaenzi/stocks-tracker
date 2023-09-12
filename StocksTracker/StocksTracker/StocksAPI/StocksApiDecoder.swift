//
//  StocksApiDecoder.swift
//  StocksTracker
//
//  Created by Rigoberto Saenz on 12/09/23.
//

import Foundation

class StocksApiDecoder {
  static func quotes(from data: Data) -> QuoteDecodingResult {
    do {
      let result = try JSONDecoder().decode([StocksApiQuote].self, from: data)
      return .success(quotes: result)
    }
    catch {
      return .failure(error: error)
    }
  }

  static func quotesShort(from data: Data) -> QuoteShortDecodingResult {
    do {
      let result = try JSONDecoder().decode([StocksApiQuoteShort].self, from: data)
      return .success(quotesShort: result)
    }
    catch {
      return .failure(error: error)
    }
  }

  static func priceChanges(from data: Data) -> PriceChangeDecodingResult {
    do {
      let result = try JSONDecoder().decode([StocksApiPriceChange].self, from: data)
      return .success(priceChanges: result)
    }
    catch {
      return .failure(error: error)
    }
  }

  static func profiles(from data: Data) -> ProfileDecodingResult {
    do {
      let result = try JSONDecoder().decode([StocksApiProfile].self, from: data)
      return .success(profiles: result)
    }
    catch {
      return .failure(error: error)
    }
  }
}

enum QuoteDecodingResult {
  case success(quotes: [StocksApiQuote])
  case failure(error: Error)
}

enum QuoteShortDecodingResult {
  case success(quotesShort: [StocksApiQuoteShort])
  case failure(error: Error)
}

enum PriceChangeDecodingResult {
  case success(priceChanges: [StocksApiPriceChange])
  case failure(error: Error)
}

enum ProfileDecodingResult {
  case success(profiles: [StocksApiProfile])
  case failure(error: Error)
}
