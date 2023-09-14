//
//  StockData.swift
//  StocksTracker
//
//  Created by Rigoberto Saenz on 11/09/23.
//

import Foundation
import SwiftUI

private let spaces = "       "
private let initColor = Color.gray

struct StockData: Identifiable {
  var id: String { ticker }
  let ticker: String

  // Header
  let imageURL: URL?
  var name = spaces
  var price = spaces

  // Today
  var todayPercent = spaces
  var todayColor = initColor

  // 1 Month
  var oneMonthPercent = spaces
  var oneMonthColor = initColor

  // 6 Months
  var sixMonthsPercent = spaces
  var sixMonthsColor = initColor

  // YTD
  var ytdPercent = spaces
  var ytdColor = initColor

  init(ticker: String) {
    self.ticker = ticker.uppercased()
    self.imageURL = URL(string: "https://hapi-ticker-images.s3.amazonaws.com/\(self.ticker).png")
  }
}
