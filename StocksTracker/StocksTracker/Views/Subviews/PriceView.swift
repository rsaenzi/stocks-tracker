//
//  PriceView.swift
//  StocksTracker
//
//  Created by Rigoberto Saenz on 11/09/23.
//

import SwiftUI

struct PriceView: View {
  private var data: StockData

  init(data: StockData) {
    self.data = data
  }

  var body: some View {
    HStack(alignment: .center, content: {

      VStack(alignment: .leading, spacing: 5, content: {
        Text("Today")
        Text("6 Months")
      })
      .font(.subheadline)
      .foregroundStyle(.secondary)

      Spacer()

      VStack(alignment: .trailing, spacing: 5, content: {
        Text(data.todayPercent)
          .foregroundStyle(data.todayColor)

        Text(data.sixMonthsPercent)
          .foregroundStyle(data.sixMonthsColor)
      })
      .font(.headline)

      Spacer()

      VStack(alignment: .leading, spacing: 5, content: {
        Text("1 Month")
        Text("YTD")
      })
      .font(.subheadline)
      .foregroundStyle(.secondary)

      Spacer()

      VStack(alignment: .trailing, spacing: 5, content: {
        Text(data.oneMonthPercent)
          .foregroundStyle(data.oneMonthColor)

        Text(data.ytdPercent)
          .foregroundStyle(data.ytdColor)
      })
      .font(.headline)
    })
  }
}

#Preview {
  PriceView(data: PreviewProvider.nvidia.data)
}
