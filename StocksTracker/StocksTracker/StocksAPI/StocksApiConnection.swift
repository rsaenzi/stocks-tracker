//
//  StocksApi.swift
//  StocksTracker
//
//  Created by Rigoberto Saenz on 12/09/23.
//

import Foundation

class StocksApiConnection {
  static func connect(to endpoint: StocksApiEndpoint) async -> StocksApiConnectionResult {
    do {
      let result = try await URLSession.shared.data(from: endpoint.url)
      return .success(data: result.0, urlResponse: result.1)
    }
    catch {
      return .failure(error: error)
    }
  }
}

enum StocksApiConnectionResult {
  case success(data: Data, urlResponse: URLResponse)
  case failure(error: Error)
}
