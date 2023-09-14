//
//  LeftColumnView.swift
//  StocksTracker
//
//  Created by Rigoberto Saenz on 12/09/23.
//

import SwiftUI

struct LeftColumnView: View {
  private var tickers: [CardViewModel] = [
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
    VStack(alignment: .center, spacing: 20, content: {
      Text("Stocks Tracker")
        .font(.extraLargeTitle)
        .foregroundStyle(.yellow)
        .offset(z: 30)
        .shadow(radius: 5)

      NavigationSplitView {

        List(tickers, id: \.data.id) { model in
          NavigationLink {
            RightColumnView(stockData: model)

          } label: {
            LeftColumnCell(ticker: model.data.ticker)
          }
        }
        .navigationTitle("Favorites")

      } detail: {
        Text("Destination")
      }

    })
  }
}

#Preview {
  LeftColumnView()
}
