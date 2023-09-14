//
//  LeftColumnCell.swift
//  StocksTracker
//
//  Created by Rigoberto Saenz on 12/09/23.
//

import SwiftUI

struct LeftColumnCell: View {
  @ObservedObject private var viewModel: CardViewModel

  init(ticker: String) {
    self.viewModel = .init(ticket: ticker)
  }

  var body: some View {

    VStack(alignment: .leading, spacing: 10) {
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
          })
          .font(.largeTitle)
          .foregroundStyle(.primary)
          .shadow(radius: 5)

          HStack(alignment: .center, content: {
            Text(viewModel.data.price)
              .animation(.spring)

          })
          .font(.title)
          .foregroundStyle(.secondary)
          .shadow(radius: 5)
        })
        .offset(z: 40)

        Spacer()

      })

      HStack(alignment: .center, content: {

        VStack(alignment: .leading, spacing: 5, content: {
          Text("Today")
          Text("6 Months")
          Text("YTD")
        })
        .font(.subheadline)
        .foregroundStyle(.secondary)
        .offset(z: 30)

        Spacer()

        VStack(alignment: .trailing, spacing: 5, content: {
          Text(viewModel.data.todayPercent)
            .foregroundStyle(viewModel.data.todayColor)
            .animation(.easeIn)
            .offset(z: 30)

          Text(viewModel.data.sixMonthsPercent)
            .foregroundStyle(viewModel.data.sixMonthsColor)
            .animation(.easeIn)
            .offset(z: 30)

          Text(viewModel.data.ytdPercent)
            .foregroundStyle(viewModel.data.ytdColor)
            .animation(.easeIn)
            .offset(z: 30)
        })
        .font(.headline)
      })
    }


    .padding()
    .overlay(
      RoundedRectangle(cornerRadius: 8)
        .stroke(.secondary, lineWidth: 2)
        .offset(z: 10)
        .shadow(radius: 15)
    )
    .task {
      repeat {
        await viewModel.viewWillAppear()
        try? await Task.sleep(for: .seconds(2))
      } while (!Task.isCancelled)
    }
  }
}

#Preview {
  LeftColumnCell(ticker: PreviewProvider.test.data.ticker)
}
