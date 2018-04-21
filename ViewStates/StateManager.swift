//
// Created by DatouHsu on 4/21/18.
// Copyright (c) 2018 polydice. All rights reserved.
//

import Foundation
import UIKit

enum StatesType: String {
  case error =   "error"
  case empty =   "empty"
  case loading = "loading"
  case none =    "none"
}

class StateManager {
  static let sharedInstance = StateManager()

  var viewStore: [String: UIView] = [:]

  public func viewForState(_ state: String) -> UIView? {
    return viewStore[state]
  }

  public func addView(_ view: UIView, forState state: String, superview: UIView) {
    viewStore[state] = view
    superview.addSubview(view)
  }

  public func removeViewForState(_ state: String) {
    viewStore[state]?.removeFromSuperview()
    viewStore[state] = nil
  }

  public func removeAllViews() {
    for (_, view) in self.viewStore {
      view.removeFromSuperview()
      viewStore = [:]
    }
  }
}
