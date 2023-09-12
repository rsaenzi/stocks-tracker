//
//  SymbolCardView.swift
//  StocksTracker
//
//  Created by Rigoberto Saenz on 11/09/23.
//

import SwiftUI

struct SymbolCardView: View {
  @ObservedObject private var viewModel: SymbolCardViewModel

  init(ticket: String) {
    self.viewModel = .init(ticket: ticket)
  }

  var body: some View {
    VStack(alignment: .leading, spacing: 20, content: {
      SymbolNameView(data: viewModel.data)
      SymbolPerfView(data: viewModel.data)
    })
    .padding()
    .overlay(
      RoundedRectangle(cornerRadius: 16)
        .stroke(.primary, lineWidth: 2)
    )
    .frame(width: 300)
    .task {
      await viewModel.quoteShort()
    }
  }
}

#Preview {
  SymbolCardView(ticket: "NVDA")
}
