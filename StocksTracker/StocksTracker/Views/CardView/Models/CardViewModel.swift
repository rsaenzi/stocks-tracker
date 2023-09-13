//
//  SymbolCardViewModel.swift
//  StocksTracker
//
//  Created by Rigoberto Saenz on 12/09/23.
//

import Foundation

class CardViewModel: ObservableObject {
  @Published var data: StockData

  init(ticket: String) {
    data = .init(ticker: ticket)
  }

  func viewWillAppear() async {
    await quote()
    await priceChanges()
  }

  func quoteShort() async {
    guard let quoteShort = await StocksApi.quotesShort(from: [data.ticker]).first else { return }

    await MainActor.run {
      data.price = "$\(String(format: "%.2f", quoteShort.price))"
    }
  }

  func quote() async {
    guard let quote = await StocksApi.quotes(from: [data.ticker]).first else { return }

    await MainActor.run {
      data.name = quote.name
      data.price = "$\(String(format: "%.2f", quote.price))"

      if quote.change >= 0 {
        data.todayPercent = "↑ \(String(format: "%.2f", quote.changesPercentage))%"
        data.todayColor = .green
      }
      else {
        data.todayPercent = "↓ \(String(format: "%.2f", quote.changesPercentage))%"
        data.todayColor = .red
      }
    }
  }

  func priceChanges() async {
    guard let priceChanges = await StocksApi.priceChanges(from: [data.ticker]).first else { return }

    await MainActor.run {
      if priceChanges.oneMonth >= 0 {
        data.oneMonthPercent = "↑ \(String(format: "%.2f", priceChanges.oneMonth))%"
        data.oneMonthColor = .green
      }
      else {
        data.oneMonthPercent = "↓ \(String(format: "%.2f", priceChanges.oneMonth))%"
        data.oneMonthColor = .red
      }

      if priceChanges.sixMonths >= 0 {
        data.sixMonthsPercent = "↑ \(String(format: "%.2f", priceChanges.sixMonths))%"
        data.sixMonthsColor = .green
      }
      else {
        data.sixMonthsPercent = "↓ \(String(format: "%.2f", priceChanges.sixMonths))%"
        data.sixMonthsColor = .red
      }

      if priceChanges.ytd >= 0 {
        data.ytdPercent = "↑ \(String(format: "%.2f", priceChanges.ytd))%"
        data.ytdColor = .green
      }
      else {
        data.ytdPercent = "↓ \(String(format: "%.2f", priceChanges.ytd))%"
        data.ytdColor = .red
      }
    }
  }
}
