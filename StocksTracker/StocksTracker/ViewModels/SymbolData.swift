//
//  SymbolData.swift
//  StocksTracker
//
//  Created by Rigoberto Saenz on 11/09/23.
//

import Foundation
import SwiftUI

struct SymbolData: Identifiable {
  let id: UUID
  let ticker: String

  var name = ""
  var price = ""
  var imageURL: URL?

  var todayPercent = ""
  var todayValue = ""
  var todayColor = Color.gray

  var monthPercent = ""
  var monthValue = ""
  var monthColor = Color.gray

  var ytdPercent = ""
  var ytdValue = ""
  var ytdColor = Color.gray

  init(ticker: String) {
    self.id = UUID()
    self.ticker = ticker.uppercased()
    self.imageURL = URL(string: "https://hapi-ticker-images.s3.amazonaws.com/\(self.ticker).png")
  }
}
