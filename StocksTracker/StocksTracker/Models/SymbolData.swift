//
//  SymbolData.swift
//  StocksTracker
//
//  Created by Rigoberto Saenz on 11/09/23.
//

import Foundation
import SwiftUI

struct SymbolData: Identifiable {
  let id = UUID()

  let image: Image
  let ticker: String
  let name: String
  let value: String

  let todayPercent: String
  let todayValue: String
  let todayColor: Color

  let monthPercent: String
  let monthValue: String
  let monthColor: Color

  let ytdPercent: String
  let ytdValue: String
  let ytdColor: Color
}
