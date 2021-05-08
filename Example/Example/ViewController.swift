//
//  ViewController.swift
//  Example
//
//  Created by Stacy on 24.04.21.
//

import UIKit
import CoreGraphics

class ViewController: UIViewController {
    
    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet weak var tempImageView: UIImageView!
    
    var lastPoint = CGPoint.zero
    var color = UIColor.black
    var brushWidth: CGFloat = 15.0
    var swiped = false
    
    var tapGestureRecognizerNumberPadView : UITapGestureRecognizer?
    
    @IBAction func resetPressed(_ sender: Any) {
        mainImageView.image = nil
        tempImageView.image = nil
    }
    @IBAction func saveTapped(_ sender: Any) {
        if let image = tempImageView.image {
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
           }

    }
    
    @IBAction func widthPressed(_ sender: UIButton) {
        guard let width = BrushWidth(tag: sender.tag) else {
          return
        }
        brushWidth = width.size
    }
    
    @IBAction func pencilPressed(_ sender: UIButton) {
        guard let pencil = Pencil(tag: sender.tag) else {
          return
        }
        color = pencil.color
    }
    
    func drawLine(from fromPoint: CGPoint, to toPoint: CGPoint) {
      UIGraphicsBeginImageContext(view.frame.size)
      guard let context = UIGraphicsGetCurrentContext() else {
        return
      }
      tempImageView.image?.draw(in: view.bounds)
      
      context.move(to: fromPoint)
      context.addLine(to: toPoint)
      
      context.setLineCap(.round)
      context.setBlendMode(.normal)
      context.setLineWidth(brushWidth)
      context.setStrokeColor(color.cgColor)
      
      context.strokePath()
      
      tempImageView.image = UIGraphicsGetImageFromCurrentImageContext()
      
      UIGraphicsEndImageContext()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      guard let touch = touches.first else {
        return
      }
      swiped = false
      lastPoint = touch.location(in: view)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
      guard let touch = touches.first else {
        return
      }
      swiped = true
      let currentPoint = touch.location(in: view)
      drawLine(from: lastPoint, to: currentPoint)
      
      lastPoint = currentPoint
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
      if !swiped {
        drawLine(from: lastPoint, to: lastPoint)
      }

      UIGraphicsBeginImageContext(mainImageView.frame.size)
      mainImageView.image?.draw(in: view.bounds, blendMode: .normal, alpha: 1.0)
      mainImageView.image = UIGraphicsGetImageFromCurrentImageContext()
      UIGraphicsEndImageContext()
    }
    
}


