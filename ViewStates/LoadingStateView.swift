//
// Created by DatouHsu on 4/21/18.
// Copyright (c) 2018 polydice. All rights reserved.
//

import UIKit

class LoadingStateView: BaseView {

  override func setupView() {
    super.setupView()
    self.frame = super.frame
    let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
    activityIndicator.startAnimating()
    activityIndicator.center = super.center
    activityIndicator.tag = 200
    self.addSubview(activityIndicator)
  }

}
