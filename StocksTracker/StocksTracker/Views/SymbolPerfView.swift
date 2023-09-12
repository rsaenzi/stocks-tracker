//
//  SymbolPerfView.swift
//  StocksTracker
//
//  Created by Rigoberto Saenz on 11/09/23.
//

import SwiftUI

struct SymbolPerfView: View {
  var data: SymbolData

  var body: some View {
    HStack(alignment: .center, content: {

      VStack(alignment: .leading, spacing: 5, content: {
        Text("Today")
        Text("Month")
        Text("YTD")
      })
      .font(.headline)
      .foregroundStyle(.secondary)

      Spacer()

      VStack(alignment: .trailing, spacing: 5, content: {
        Text(data.todayPercent)
          .foregroundStyle(data.todayColor)

        Text(data.monthPercent)
          .foregroundStyle(data.monthColor)

        Text(data.ytdPercent)
          .foregroundStyle(data.ytdColor)
      })
      .font(.subheadline)

      Spacer()

      VStack(alignment: .trailing, spacing: 5, content: {
        Text(data.todayValue)
          .foregroundStyle(data.todayColor)

        Text(data.monthValue)
          .foregroundStyle(data.monthColor)

        Text(data.ytdValue)
          .foregroundStyle(data.ytdColor)
      })
      .font(.subheadline)

    })
  }
}

#Preview {
  SymbolPerfView(data: PreviewProvider.nvidia)
}
