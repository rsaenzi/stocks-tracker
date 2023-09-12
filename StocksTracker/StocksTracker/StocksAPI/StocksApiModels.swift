//
//  StocksApiQuote.swift
//  StocksTracker
//
//  Created by Rigoberto Saenz on 12/09/23.
//

import Foundation

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

struct StocksApiQuoteShort: Codable {
  let symbol: String
  let price: Float
}

struct StocksApiPriceChange: Codable {
  let symbol: String
  let _1D: Float
  let _5D: Float
  let _1M: Float
  let _3M: Float
  let _6M: Float
  let ytd: Float
  let _1Y: Float
  let _3Y: Float
  let _5Y: Float
  let _10Y: Float
  let max: Float
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
