//
//  SliderCostumHeight.swift
//  MR.Baby
//
//  Created by İlker isa Mercan on 20.07.2020.
//  Copyright © 2020 Mahmut Mercan. All rights reserved.
//

import Foundation
import UIKit

class SliderCostumHeight: UISlider {
  @IBInspectable var trackHeight: CGFloat = 2

  override func trackRect(forBounds bounds: CGRect) -> CGRect {
    return CGRect(origin: bounds.origin, size: CGSize(width: bounds.width, height: trackHeight))
  }
}

