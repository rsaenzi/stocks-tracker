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

  /// Initializes this object using mock data
  init(symbol: String) {
    self.symbol = symbol
    self.price = Float.random(in: -20...20)
  }
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

  /// Initializes this object using mock data
  init(symbol: String) {
    self.symbol = symbol
    self.name = ""
    self.price = Float.random(in: 0...500)
    self.changesPercentage = Float.random(in: -20...20)
    self.change = Float.random(in: -20...20)
    self.exchange = "NASDAQ"
    self.eps = Float.random(in: -20...20)
    self.pe = Float.random(in: -20...20)
  }
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

  /// Initializes this object using mock data
  init(symbol: String) {
    self.symbol = symbol
    self.oneDay = Float.random(in: -20...20)
    self.fiveDays = Float.random(in: -20...20)
    self.oneMonth = Float.random(in: -20...20)
    self.threeMonths = Float.random(in: -20...20)
    self.sixMonths = Float.random(in: -20...20)
    self.ytd = Float.random(in: -20...20)
    self.oneYear = Float.random(in: -20...20)
    self.threeYears = Float.random(in: -20...20)
    self.fiveYears = Float.random(in: -20...20)
    self.tenYears = Float.random(in: -20...20)
    self.max = Float.random(in: -20...20)
  }

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

  /// Initializes this object using mock data
  init(symbol: String) {
    self.symbol = symbol
    self.price = Float.random(in: 0...500)
    self.companyName = ""
    self.currency = ""
    self.exchange = ""
    self.exchangeShortName = ""
    self.industry = ""
    self.website = ""
    self.description = ""
    self.ceo = ""
    self.sector = ""
    self.country = ""
    self.fullTimeEmployees = Float.random(in: 500...2000)
    self.phone = ""
    self.address = ""
    self.city = ""
    self.state = ""
    self.zip = ""
    self.image = ""
    self.ipoDate = ""
  }
}
