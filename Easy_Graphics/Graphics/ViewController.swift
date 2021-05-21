//
//  ViewController.swift
//  Graphics
//
//  Created by Stacy Vinogradova on 8.05.21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var NewView: UIView!
    
    @IBOutlet weak var InfoLable: UILabel!
    
    @IBOutlet weak var Circle: CircleView!
    
    @IBOutlet weak var Triangle: TriangleView!
    var isTogether: Bool = false
    var TagID: Int = 100

    override func viewDidLoad() {
        super.viewDidLoad()
        NewView.addSubview(Circle)
        NewView.addSubview(Triangle)
    }

    @IBAction func tapAddTo2nd(_ sender: Any) {
        if(!isTogether) {
            isTogether = true
            InfoLable.text = ""
            Triangle.center = NewView.center
            Circle.center = Triangle.center
        }
        else {
            NewView.bringSubviewToFront(Triangle)
        }
    }
    
    @IBAction func tapAddTo1st(_ sender: Any) {
        
        if(!isTogether) {
            isTogether = true
            InfoLable.text = ""
            Triangle.center = NewView.center
            NewView.bringSubviewToFront(Circle)
            Circle.center = Triangle.center
        }
        else {
            NewView.bringSubviewToFront(Circle)
        }
    }
    
    @IBAction func tapRotateButton(_ sender: Any) {
        if(isTogether){
            UIView.animate(withDuration: 0.5, animations: {
                self.NewView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            })
            UIView.animate(withDuration: 1, delay: 0.45, animations: { self.NewView.transform = CGAffineTransform(rotationAngle: CGFloat.pi * 2)
            })
        }
        else {
            InfoLable.text = "Please add figures to each other."
        }
    }
    
    @IBAction func tapAlphaButton(_ sender: Any) {
        if(isTogether){
            UIView.animate(withDuration: 1.5, animations: {
                self.NewView.alpha = 1.0
                self.NewView.alpha = 0
                self.NewView.alpha = 1.0
            })
        }
        else {
            InfoLable.text = "Please add figures to each other."
        }
    }
    
    @IBAction func tapMoveButton(_ sender: Any) {
        if(isTogether){
            UIView.animate(withDuration: 0.5, animations: {
                self.NewView.transform = CGAffineTransform(translationX: 0, y: -200)
                UIView.animate(withDuration: 1, delay: 0.45, animations: { self.NewView.transform = CGAffineTransform(translationX: 0, y: 0)
                })
            })
            
        }
        else {
            InfoLable.text = "Please add figures to each other."
        }
    }
    
    @IBAction func tapBothButton(_ sender: Any) {
        if(isTogether){
            tapAlphaButton((Any).self)
            if ((Int.random(in: 0..<2)) == 0) {
                tapMoveButton((Any).self)
            }
            else {
                tapRotateButton((Any).self)
            }
        }
        else {
            InfoLable.text = "Please add figures to each other."
        }
    }
    
    func removeTr(triangle: TriangleView) {
        triangle.removeFromSuperview()
    }
    
    @IBAction func tap(sender: AnyObject) {
        if(Triangle.center != NewView.center) {
            let tr = TriangleView.init(frame: Triangle.frame)
            tr.backgroundColor = UIColor.clear
            tr.InsideColor = UIColor.blue
            tr.OutsideColor = UIColor.green
            NewView.addSubview(tr)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.removeTr(triangle: tr)
            }
        }
    }
    
    @IBAction func pinch(sender: AnyObject) {
        if(Triangle.center != NewView.center) {
            let tr = TriangleView.init(frame: Triangle.frame)
            tr.backgroundColor = UIColor.clear
            tr.InsideColor = UIColor.black
            tr.OutsideColor = UIColor.red
            NewView.addSubview(tr)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.removeTr(triangle: tr)
            }
        }
    }
    
    @IBAction func rotation(sender: AnyObject) {
        if(Triangle.center != NewView.center) {
            let tr = TriangleView.init(frame: Triangle.frame)
            tr.backgroundColor = UIColor.clear
            tr.InsideColor = UIColor.systemYellow
            tr.OutsideColor = UIColor.orange
            NewView.addSubview(tr)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.removeTr(triangle: tr)
            }
        }
    }
    
    @IBAction func longPress(sender: AnyObject) {
        if(Triangle.center != NewView.center) {
            let tr = TriangleView.init(frame: Triangle.frame)
            tr.backgroundColor = UIColor.clear
            tr.InsideColor = UIColor.black
            tr.OutsideColor = UIColor.cyan
            NewView.addSubview(tr)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.removeTr(triangle: tr)
            }
        }
    }
    
    @IBAction func swipe(sender: AnyObject) {
        if(Triangle.center != NewView.center) {
            let tr = TriangleView.init(frame: Triangle.frame)
            tr.backgroundColor = UIColor.clear
            tr.InsideColor = UIColor.magenta
            tr.OutsideColor = UIColor.white
            NewView.addSubview(tr)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.removeTr(triangle: tr)
            }
        }
    }
    
}

