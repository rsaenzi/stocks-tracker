//
//  TwoColumnsView.swift
//  StocksTracker
//
//  Created by Rigoberto Saenz on 12/09/23.
//

import SwiftUI

struct TwoColumnsView: View {
  private var tickersLeft: [TwoColumnsItemViewModel] = [
    .init(ticker: "AMD"),
    .init(ticker: "NVDA"),
    .init(ticker: "GOOG"),
    .init(ticker: "AMZN"),
    .init(ticker: "PLTR"),
  ]

  private var tickersRight: [TwoColumnsItemViewModel] = [
    .init(ticker: "AVGO"),
    .init(ticker: "AAPL"),
    .init(ticker: "MSFT"),
    .init(ticker: "META"),
    .init(ticker: "NFLX"),
  ]

  var body: some View {
    VStack(alignment: .center, spacing: 20, content: {
      Text("Portfolio")
        .font(.largeTitle)
        .foregroundStyle(.primary)

      HStack(alignment: .center, spacing: 0, content: {
        List(tickersLeft) {
          TwoColumnsItemView(ticker: $0.ticker)
        }
        List(tickersRight) {
          TwoColumnsItemView(ticker: $0.ticker)
        }
      })
    })
  }
}

#Preview {
  TwoColumnsView()
}
