//
//  SymbolPerfView.swift
//  StocksTracker
//
//  Created by Rigoberto Saenz on 11/09/23.
//

import SwiftUI

struct SymbolPerfView: View {
  var body: some View {
    HStack(alignment: .center, content: {
      VStack(alignment: .leading, spacing: 5, content: {
        Text("Today")
          .font(.headline)
          .foregroundStyle(.secondary)

        Text("Month")
          .font(.headline)
          .foregroundStyle(.secondary)

        Text("YTD")
          .font(.headline)
          .foregroundStyle(.secondary)
      })

      Spacer()

      VStack(alignment: .trailing, spacing: 5, content: {
        Text("↑ 1.10%")
          .font(.subheadline)
          .foregroundStyle(.green)

        Text("↑ 5.27%")
          .font(.subheadline)
          .foregroundStyle(.green)

        Text("↑ 41.91%")
          .font(.subheadline)
          .foregroundStyle(.green)
      })

      Spacer()

      VStack(alignment: .trailing, spacing: 5, content: {
        Text("+ $3.67")
          .font(.subheadline)
          .foregroundStyle(.green)

        Text("+ $16.93")
          .font(.subheadline)
          .foregroundStyle(.green)

        Text("+ $98.12")
          .font(.subheadline)
          .foregroundStyle(.green)
      })
    })
  }
}

#Preview {
  SymbolPerfView()
}
