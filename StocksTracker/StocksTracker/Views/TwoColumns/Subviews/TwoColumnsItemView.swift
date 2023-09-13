//
//  TwoColumnsItemView.swift
//  StocksTracker
//
//  Created by Rigoberto Saenz on 12/09/23.
//

import SwiftUI

struct TwoColumnsItemView: View {
  var ticker: String

  var body: some View {
    CardView(ticker: ticker)
  }
}

#Preview {
  TwoColumnsItemView(ticker: PreviewProvider.test.data.ticker)
}
