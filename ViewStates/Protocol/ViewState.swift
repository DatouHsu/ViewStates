//
// Created by DatouHsu on 4/21/18.
// Copyright (c) 2018 polydice. All rights reserved.
//

import UIKit

protocol ViewState {
  var stateManager: StateManager? { get }

  var loadingView: UIView? { get }
  var errorView: UIView? { get }
  var emptyView: UIView? { get }

  var errorMessage: String? { get set }
  func addView(withState state: StatesType)
}

extension ViewState where Self: UIViewController {

  var stateManager: StateManager? {
    return StateManager.sharedInstance
  }

  var loadingView: UIView? {
    return LoadingStateView(frame: UIScreen.main.bounds)
  }

  var errorView: UIView? {
    let errorStateView = ErrorStateView(frame: UIScreen.main.bounds)
    errorStateView.setTextToLabel(text: errorMessage!)
    return errorStateView
  }

  var emptyView: UIView? {
    return EmptyStateView(frame: UIScreen.main.bounds)
  }

  func addView(withState state: StatesType) {
    switch state {
    case .loading:
      stateManager?.addView(loadingView!,
              forState: StatesType.loading.rawValue,
              superview: view)
      break
    case .error:
      stateManager?.addView(errorView!,
              forState: StatesType.error.rawValue,
              superview: view)

      break
    case .empty:
      stateManager?.addView(emptyView!,
              forState: StatesType.empty.rawValue,
              superview: view)
      break
    default:
      removeAllViews()
      break
    }
  }

  func removeAllViews() {
    stateManager?.removeAllViews()
  }

}
