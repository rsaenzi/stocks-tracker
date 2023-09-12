//
//  SymbolCardView.swift
//  StocksTracker
//
//  Created by Rigoberto Saenz on 11/09/23.
//

import SwiftUI

struct SymbolCardView: View {
  var data: SymbolData

  var body: some View {
    VStack(alignment: .leading, spacing: 20, content: {
      SymbolNameView(data: data)
      SymbolPerfView(data: data)
    })
    .padding()
    .overlay(
      RoundedRectangle(cornerRadius: 16)
        .stroke(.primary, lineWidth: 2)
    )
    .frame(width: 300)
  }
}

#Preview {
  SymbolCardView(data: PreviewProvider.nvidia)
}
