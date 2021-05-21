//
//  GraphicsTriangle.swift
//  Graphics
//
//  Created by Stacy Vinogradova on 24.04.21.
//

import UIKit

@IBDesignable
final class TriangleView: UIView {
    
    @IBInspectable var InsideColor: UIColor = .clear
    @IBInspectable var OutsideColor: UIColor = .clear
    
    override func draw(_ rect: CGRect) {
        let startPoint = CGPoint(x: bounds.size.width/2, y: 0)
        let endPoint = CGPoint(x: bounds.size.width/2, y: bounds.size.height)
        let radius = 30.0
        let colors = [InsideColor, OutsideColor]
        let triangle = UIBezierPath.init(cgPath: createRoundedTriangle(width: bounds.size.width, height: bounds.size.height - 50, radius: CGFloat(radius)))
        let shadowColors = [UIColor.black.withAlphaComponent(0.6), UIColor.clear]
        let shadow = UIBezierPath.init(cgPath: createRoundedTriangle(width: bounds.size.width, height: bounds.size.height - 50, radius: CGFloat(radius)))
        shadow.apply(CGAffineTransform.init(translationX: 0, y: 50))
        drawLinearGradient(inside: shadow, start: startPoint, end: endPoint, colors: shadowColors)
        drawLinearGradient(inside: triangle, start: startPoint, end: endPoint, colors: colors)
        self.backgroundColor = UIColor.clear
    }
    
    func drawLinearGradient(inside path:UIBezierPath, start:CGPoint, end:CGPoint, colors:[UIColor])
    {
        guard let ctx = UIGraphicsGetCurrentContext() else { return }

        ctx.saveGState()
        defer { ctx.restoreGState() }

        path.addClip()

        let cgColors = colors.map({ $0.cgColor })
        guard let gradient = CGGradient(colorsSpace: nil, colors: cgColors as CFArray, locations: nil)
            else { return }

        ctx.drawLinearGradient(gradient, start: start, end: end, options: [])
    }

    private func setUpGradient() -> CAGradientLayer {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.orange.cgColor, UIColor.yellow.cgColor]
        return gradient
    }
    
    func createRoundedTriangle(width: CGFloat, height: CGFloat, radius: CGFloat) -> CGMutablePath {

        let point1 = CGPoint(x: width / 2, y: 0)//-width/2
        let point2 = CGPoint(x: width, y: height)
        let point3 = CGPoint(x: 0, y: height)

        let path = CGMutablePath()
        path.move(to: CGPoint(x: 0, y: height))
        path.addArc(tangent1End: point1, tangent2End: point2, radius: radius)
        path.addArc(tangent1End: point2, tangent2End: point3, radius: radius)
        path.addArc(tangent1End: point3, tangent2End: point1, radius: radius)
        path.closeSubpath()
        
        return path
    }
}
