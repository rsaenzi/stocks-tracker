//
//  LeftColumnItem.swift
//  StocksTracker
//
//  Created by Rigoberto Saenz on 12/09/23.
//

import SwiftUI

struct LeftColumnItem: View {
  @ObservedObject private var viewModel: CardViewModel

  init(ticker: String) {
    self.viewModel = .init(ticket: ticker)
  }

  var body: some View {

    HStack(alignment: .center, spacing: 20, content: {

      AsyncImage(url: viewModel.data.imageURL) { image in
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
      .offset(z: 30)

      VStack(alignment: .leading, content: {

        HStack(alignment: .center, content: {
          Text(viewModel.data.ticker)
            .offset(z: 30)
        })
        .font(.largeTitle)
        .foregroundStyle(.primary)
        .shadow(radius: 5)

        HStack(alignment: .center, content: {
          Text(viewModel.data.price)
            .offset(z: 30)
        })
        .font(.title)
        .foregroundStyle(.secondary)
        .shadow(radius: 5)
      })

      Spacer()
    })
    .padding()
    .overlay(
      RoundedRectangle(cornerRadius: 16)
        .stroke(.secondary, lineWidth: 2)
        .offset(z: 20)
        .shadow(radius: 10)
    )
    .task {
      await viewModel.viewWillAppear()
    }
  }
}

#Preview {
  LeftColumnItem(ticker: PreviewProvider.test.data.ticker)
}
