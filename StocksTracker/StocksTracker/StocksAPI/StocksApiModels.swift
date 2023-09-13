//
//  StocksApiQuote.swift
//  StocksTracker
//
//  Created by Rigoberto Saenz on 12/09/23.
//

import Foundation

struct StocksApiQuoteShort: Codable {
  let symbol: String
  let price: Float
}

struct StocksApiQuote: Codable {
  let symbol: String
  let name: String
  let price: Float
  let changesPercentage: Float
  let change: Float
  let exchange: String
  let eps: Float
  let pe: Float
}

struct StocksApiPriceChange: Codable {
  let symbol: String
  let oneDay: Float
  let fiveDays: Float
  let oneMonth: Float
  let threeMonths: Float
  let sixMonths: Float
  let ytd: Float
  let oneYear: Float
  let threeYears: Float
  let fiveYears: Float
  let tenYears: Float
  let max: Float

  enum CodingKeys: String, CodingKey {
    case symbol = "symbol"
    case oneDay = "1D"
    case fiveDays = "5D"
    case oneMonth = "1M"
    case threeMonths = "3M"
    case sixMonths = "6M"
    case ytd = "ytd"
    case oneYear = "1Y"
    case threeYears = "3Y"
    case fiveYears = "5Y"
    case tenYears = "10Y"
    case max = "max"
  }
}

struct StocksApiProfile: Codable {
  let symbol: String
  let price: Float
  let companyName: String
  let currency: String
  let exchange: String
  let exchangeShortName: String
  let industry: String
  let website: String
  let description: String
  let ceo: String
  let sector: String
  let country: String
  let fullTimeEmployees: Float
  let phone: String
  let address: String
  let city: String
  let state: String
  let zip: String
  let image: String
  let ipoDate: String
}
