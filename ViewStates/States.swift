//
//  States.swift
//  ViewStates
//
//  Created by DatouHsu on 4/21/18.
//  Copyright © 2018 polydice. All rights reserved.
//

import UIKit

class States: UIView {
  
  override func awakeFromNib() {}

  static func instanceFromNib() -> States {
    return UINib(nibName: "States", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! States
  }

}
