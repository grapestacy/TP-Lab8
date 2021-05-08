//
//  ViewController.swift
//  Gestures
//
//  Created by Stacy on 24.04.21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var gestureIndicator: UILabel!
    
    @IBAction func tap(sender: AnyObject) {
        gestureIndicator.text = "Gesture: tap\n Background color: green"
        
        gestureIndicator.backgroundColor = .green
        
    }
    
    @IBAction func pinch(sender: AnyObject) {
        gestureIndicator.text = "Gesture: pinch\n Background color: red"
        
        gestureIndicator.backgroundColor = .red

    }
    
    @IBAction func rotation(sender: AnyObject) {
        gestureIndicator.text = "Gesture: rotation\n Background color: blue"
        
        gestureIndicator.backgroundColor = .blue
    }
    
    @IBAction func longPress(sender: AnyObject) {
        gestureIndicator.text = "Gesture: long press\n Background color: orange"
        
        gestureIndicator.backgroundColor = .orange

        
    }
    
    @IBAction func swipe(sender: AnyObject) {
        gestureIndicator.text = "Gesture: swipe\n Background color: gray"
        
        gestureIndicator.backgroundColor = .gray
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        gestureIndicator.isUserInteractionEnabled = true
        gestureIndicator.textAlignment = .center
        gestureIndicator.numberOfLines = 2
        gestureIndicator.text = "Use gestures in this area"
        gestureIndicator.backgroundColor = .yellow
    }


}

