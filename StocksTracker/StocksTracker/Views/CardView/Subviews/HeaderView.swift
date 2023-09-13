//
//  HeaderView.swift
//  StocksTracker
//
//  Created by Rigoberto Saenz on 11/09/23.
//

import SwiftUI

struct HeaderView: View {
  private var data: StockData

  init(data: StockData) {
    self.data = data
  }

  var body: some View {
    HStack(alignment: .center, spacing: 10, content: {

      AsyncImage(url: data.imageURL) { image in
        image
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 50, height: 50)
          .background(.white)
          .clipShape(Circle())
          .shadow(radius: 5)

      } placeholder: {
        ProgressView()
      }

      VStack(alignment: .leading, content: {

        HStack(alignment: .center, content: {
          Text(data.ticker)

          Spacer()

          Text(data.price)
        })
        .font(.largeTitle)
        .foregroundStyle(.primary)

        Text(data.name)
          .font(.caption)
          .foregroundStyle(.secondary)
      })
    })
  }
}

#Preview {
  HeaderView(data: PreviewProvider.test.data)
}
