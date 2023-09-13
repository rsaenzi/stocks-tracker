//
//  ListView.swift
//  StocksTracker
//
//  Created by Rigoberto Saenz on 12/09/23.
//

import SwiftUI

struct ListView: View {
  private var tickers: [ListViewModel] = [
    .init(ticker: "AMD"),
    .init(ticker: "NVDA"),
    .init(ticker: "GOOG"),
    .init(ticker: "AMZN"),
    .init(ticker: "PLTR"),
    .init(ticker: "AVGO"),
    .init(ticker: "AAPL"),
    .init(ticker: "MSFT"),
    .init(ticker: "META"),
    .init(ticker: "NFLX"),
  ]

  var body: some View {
    List(tickers) {
      ListItemView(ticker: $0.ticker)
    }
  }
}

#Preview {
  ListView()
}
