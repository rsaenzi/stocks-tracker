//
//  SymbolNameView.swift
//  StocksTracker
//
//  Created by Rigoberto Saenz on 11/09/23.
//

import SwiftUI

struct SymbolNameView: View {
  var body: some View {
    HStack(alignment: .center, spacing: 10, content: {
      Image("MSFT")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 50, height: 50)
        .background(.white)
        .clipShape(Circle())
        .shadow(radius: 5)

      VStack(alignment: .leading, content: {
        HStack(alignment: .center, content: {
          Text("MSFT")
            .font(.largeTitle)
            .foregroundStyle(.primary)

          Spacer()

          Text("$337.94")
            .font(.largeTitle)
            .foregroundStyle(.primary)
        })

        Text("Microsoft Corp.")
          .font(.caption)
          .foregroundStyle(.secondary)
      })
    })
  }
}

#Preview {
  SymbolNameView()
}
