//
//  RightColumnView.swift
//  StocksTracker
//
//  Created by Rigoberto Saenz on 14/09/23.
//

import SwiftUI
import Charts

struct RightColumnView: View {
  var stockData: CardViewModel

  let data: [StockPoint] = [
    .init(date: "2023-09-14", price: 175.74),
    .init(date: "2023-09-13", price: 174.21),
    .init(date: "2023-09-12", price: 176.30),
    .init(date: "2023-09-11", price: 179.36),
    .init(date: "2023-09-08", price: 178.18),
    .init(date: "2023-09-07", price: 177.56),
    .init(date: "2023-09-06", price: 182.91),
    .init(date: "2023-09-05", price: 189.70),
    .init(date: "2023-09-01", price: 189.46),
    .init(date: "2023-08-31", price: 187.87),
    .init(date: "2023-08-30", price: 187.65),
  ]

  var body: some View {

    VStack(alignment: .center, spacing: 10, content: {
      Text(stockData.data.ticker)

      Chart(data) { point in
        LineMark(
          x: .value("Date", point.date),
          y: .value("Price", point.price)
        )
        PointMark(
          x: .value("Date", point.date),
          y: .value("Price", point.price)
        )
      }
      .chartYAxis {
        AxisMarks(values: .automatic(desiredCount: 5))
      }
      .chartXAxis {
        AxisMarks(values: .automatic(desiredCount: 10))
      }
      .padding(40)
    })
  }
}

#Preview {
  RightColumnView(stockData: PreviewProvider.test)
}


struct StockPoint: Identifiable {
  var id = UUID()
  var date: Date
  var price: Float

  init(date dateAsString: String, price: Float) {

    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"

    self.date = formatter.date(from: dateAsString) ?? Date()
    self.price = price
  }
}
