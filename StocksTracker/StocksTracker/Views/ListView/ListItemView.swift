//
//  ListItemView.swift
//  StocksTracker
//
//  Created by Rigoberto Saenz on 12/09/23.
//

import SwiftUI

struct ListItemView: View {
  var ticker: String

  var body: some View {
    CardView(ticker: ticker)
  }
}

#Preview {
  ListItemView(ticker: PreviewProvider.test.data.ticker)
}
