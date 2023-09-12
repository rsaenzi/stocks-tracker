//
//  SymbolCardView.swift
//  StocksTracker
//
//  Created by Rigoberto Saenz on 11/09/23.
//

import SwiftUI

struct SymbolCardView: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 20, content: {
      SymbolNameView()
      SymbolPerfView()
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
  SymbolCardView()
}
