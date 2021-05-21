//
//  GraphicsCircle.swift
//  Graphics
//
//  Created by Stacy Vinogradova on 23.04.21.
//

import UIKit

@IBDesignable
class CircleView: UIView {
    @IBInspectable var InsideColor: UIColor = .clear
    @IBInspectable var OutsideColor: UIColor = .clear

    override func draw(_ rect: CGRect) {
        let endRadius = min(frame.height, frame.width) / 2
        let colors = [InsideColor.cgColor, OutsideColor.cgColor] as CFArray
        let shadowColors = [UIColor.black.cgColor, UIColor.clear.cgColor] as CFArray
        let center = CGPoint(x: bounds.size.width / 2, y: bounds.size.height / 2)
        let shadowCenter = CGPoint(x: bounds.size.width / 2, y: bounds.size.height / 2 + 50)
        
        guard let gradient = CGGradient(colorsSpace: nil, colors: colors, locations: nil) else { return }
        
        guard let shadow = CGGradient(colorsSpace: nil, colors: shadowColors, locations: nil) else { return }
        
        UIGraphicsGetCurrentContext()!.drawRadialGradient(shadow, startCenter: shadowCenter, startRadius: 10, endCenter: shadowCenter, endRadius: endRadius, options: CGGradientDrawingOptions.drawsBeforeStartLocation)
        
        UIGraphicsGetCurrentContext()!.drawRadialGradient(gradient, startCenter: center, startRadius: 10, endCenter: center, endRadius: endRadius, options: CGGradientDrawingOptions.drawsBeforeStartLocation)
        self.backgroundColor = UIColor.clear
        
    }
}
