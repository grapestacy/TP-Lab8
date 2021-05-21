//
//  Pensil.swift
//  Example
//
//  Created by Stacy on 24.04.21.
//

import UIKit

enum Pencil {
  case black
  case grey
  case red
  case blue
  case darkGreen
  case darkOrange
  
  init?(tag: Int) {
    switch tag {
    case 0:
      self = .black
    case 1:
      self = .blue
    case 2:
      self = .darkGreen
    case 3:
        self = .darkOrange
    case 4:
      self = .grey
    case 5:
      self = .red
    default:
      return nil
    }
  }
  
  var color: UIColor {
    switch self {
    case .black:
      return .black
    case .grey:
      return UIColor(white: 105/255.0, alpha: 1.0)
    case .red:
      return UIColor(red: 1, green: 0, blue: 0, alpha: 1.0)
    case .blue:
      return UIColor(red: 0, green: 0, blue: 1, alpha: 1.0)
    case .darkGreen:
      return UIColor(red: 102/255.0, green: 204/255.0, blue: 0, alpha: 1.0)
    case .darkOrange:
      return UIColor(red: 1, green: 102/255.0, blue: 0, alpha: 1.0)
    }
  }
}

