//
//  SymbolCardViewModel.swift
//  StocksTracker
//
//  Created by Rigoberto Saenz on 12/09/23.
//

import Foundation

class SymbolCardViewModel: ObservableObject {
  @Published var data: SymbolData

  init(ticket: String) {
    data = .init(ticker: ticket)
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
        data.todayValue = "+ $\(String(format: "%.2f", quote.change))"
        data.todayPercent = "↑ \(String(format: "%.2f", quote.changesPercentage))%"
        data.todayColor = .green
      }
      else {
        data.todayValue = "- $\(String(format: "%.2f", quote.change))"
        data.todayPercent = "↓ \(String(format: "%.2f", quote.changesPercentage))%"
        data.todayColor = .red
      }
    }
  }
}
