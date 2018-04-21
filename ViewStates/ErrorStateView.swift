//
// Created by DatouHsu on 4/21/18.
// Copyright (c) 2018 polydice. All rights reserved.
//

import UIKit

class ErrorStateView: UIView {

  lazy var label: UILabel = {
    let label = UILabel()
    label.textColor = .lightGray
    label.textAlignment = .center
    label.text = "No results found. Click here to try again"
    return label
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupView()
  }

  func setupView() {
    self.frame = super.frame
    self.center = super.center
    let frame = CGRect(x: 0, y: 0, width: super.frame.width, height: 30)
    label.frame = frame
    label.tag = 100
    label.center = self.center
    self.addSubview(label)
  }

  func setTextToLabel(text: String) {
    label.text = text
  }

}
