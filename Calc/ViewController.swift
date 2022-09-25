//
//  ViewController.swift
//  Calc
//
//  Created by IRFAN SHAIKH on 2022-09-25.
//

import UIKit

class ViewController: UIViewController {
    
    // button container to give round border
    @IBOutlet weak var buttonContainer: UIView!
//    All operator button collection
    @IBOutlet var operatorButtons: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        operatorButtons.forEach{(button) in
            
            // added round corners to Button Container
            buttonContainer.layer.cornerRadius=48
            buttonContainer.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            // added radius to OperatorButton collection
            button.layer.cornerRadius=5
            // added shadow color to OperatorButton collection
            button.layer.shadowColor = UIColor(red: 00, green: 00, blue: 00, alpha: 0.25).cgColor
            // added shadow opacity to OperatorButton collection
            button.layer.shadowOpacity = 1.0
            // added shadow co-ordinates to OperatorButton collection
            button.layer.shadowOffset = CGSize(width: -1.0, height: 1.0)
            // added shadow blur to OperatorButton collection
            button.layer.shadowRadius = 3
            
        }
//        OpreatorButton.layer.cornerRadius=5
    }


}

