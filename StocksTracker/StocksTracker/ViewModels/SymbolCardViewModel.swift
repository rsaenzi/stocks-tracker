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
    let quotesShort = await StocksApi.quotesShort(from: [data.ticker])

    guard let quoteShort = quotesShort.first else { return }

    await MainActor.run {
      data.price = "$\(String(format: "%.2f", quoteShort.price))"
    }
  }
}
