//
//  StocksTrackerApp.swift
//  StocksTracker
//
//  Created by Rigoberto Saenz on 11/09/23.
//

import SwiftUI

@main
struct StocksTrackerApp: App {
  var body: some Scene {
    WindowGroup {
      SymbolCardView(data: PreviewProvider.nvidia)
    }
  }
}
