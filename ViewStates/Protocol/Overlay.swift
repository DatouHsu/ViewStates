//
// Created by DatouHsu on 4/21/18.
// Copyright (c) 2018 polydice. All rights reserved.
//

import Foundation
import UIKit

@objc protocol Overlay {
  var overlay: States? { get set }
  var tableViewReference: UITableView? { get set }
  @objc func handleTap(_ sender: UIView)
}

extension Overlay where Self: UIViewController {

  func addChoiceOverlay() {
    overlay = States.instanceFromNib()
    overlay?.center = view.center
    view.addSubview(overlay!)
    tableViewReference?.tableFooterView = getFooterButton()
    tableViewReference?.isHidden = true
  }

  func hideOverlay() {
    overlay?.alpha = 0
  }

  func showOverlay() {
    tableViewReference?.isHidden = true
    overlay?.alpha = 1
  }

  func addAction() {
    for (index, button) in ((overlay!.subviews as? [UIButton])?.enumerated())! {
      button.tag = index
      button.addTarget(self, action: #selector(handleTap(_:)), for: .touchUpInside)
    }
  }

  func getFooterButton() -> UIButton {
    let button = UIButton(type: .custom)
    button.frame = CGRect(x: 0, y: 0, width: 70, height: 30)
    button.backgroundColor = .black
    button.setTitleColor(.white, for: .normal)
    button.setTitle("Go Back", for: .normal)
    button.tag = 4
    button.addTarget(self, action: #selector(handleTap(_:)), for: .touchUpInside)
    return button
  }

  func reloadTable() {
    tableViewReference?.reloadData()
  }

}
