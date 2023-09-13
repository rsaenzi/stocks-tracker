//
//  ListViewModel.swift
//  StocksTracker
//
//  Created by Rigoberto Saenz on 12/09/23.
//

import Foundation

class ListViewModel: Identifiable {
  let id = UUID()
  let ticker: String

  init(ticker: String) {
    self.ticker = ticker
  }
}
