//
//  PreviewProvider.swift
//  StocksTracker
//
//  Created by Rigoberto Saenz on 11/09/23.
//

import Foundation
import SwiftUI

struct PreviewProvider {
  static var nvidia: CardViewModel {
    let model = CardViewModel(ticket: "MSFT")
    model.data.name = "Microsoft Corp"
    model.data.price = "$330.77"
    model.data.todayPercent = "↑ 1.68%"
    model.data.todayColor = .green
    model.data.oneMonthPercent = "↓ 3.89%"
    model.data.oneMonthColor = .red
    model.data.sixMonthsPercent = "↓ 23.74%"
    model.data.sixMonthsColor = .red
    model.data.ytdPercent = "↑ 78.64%"
    model.data.ytdColor = .green
    return model
  }
}
