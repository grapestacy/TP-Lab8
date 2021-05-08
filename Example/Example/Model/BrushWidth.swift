//
//  BrushWidth.swift
//  Example
//
//  Created by Stacy on 24.04.21.
//

import UIKit

enum BrushWidth {
  case superSmall
  case small
  case medium
  case large
  case superLarge

    init?(tag: Int) {
        switch tag {
        case 0:
            self = .superSmall
        case 1:
            self = .small
        case 2:
            self = .medium
        case 3:
            self = .large
        case 4:
            self = .superLarge
        default:
            return nil
        }
    }
    
    var size: CGFloat {
      switch self {
      case .superSmall:
        return 15.0
      case .small:
        return 20.0
      case .medium:
        return 30.0
      case .large:
        return 40.0
      case .superLarge:
        return 50.0
      }
    }
}
