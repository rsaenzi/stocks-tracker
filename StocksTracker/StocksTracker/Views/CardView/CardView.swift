//
//  CardView.swift
//  StocksTracker
//
//  Created by Rigoberto Saenz on 11/09/23.
//

import SwiftUI

struct CardView: View {
  @ObservedObject private var viewModel: CardViewModel

  init(ticker: String) {
    self.viewModel = .init(ticker: ticker)
  }

  var body: some View {
    VStack(alignment: .leading, spacing: 20, content: {
      HeaderView(data: viewModel.data)
      PriceView(data: viewModel.data)
    })
    .padding()
    .overlay(
      RoundedRectangle(cornerRadius: 16)
        .stroke(.secondary, lineWidth: 2)
    )
    .task {
      await viewModel.viewWillAppear()
    }
  }
}

#Preview {
  CardView(ticker: PreviewProvider.test.data.ticker)
}
