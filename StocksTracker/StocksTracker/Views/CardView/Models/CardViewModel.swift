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
    let quoteShort = await StocksApi.quoteShort(for: data.ticker)

    await MainActor.run {
      data.price = "$\(String(format: "%.2f", quoteShort.price))"
    }
  }

  func quote() async {
    let quote = await StocksApi.quote(for: data.ticker)

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
    let priceChanges = await StocksApi.priceChanges(for: data.ticker)

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
