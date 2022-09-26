//
//  ViewController.swift
//  Calculator
//
//  Created by Amrik Singh on 2022-09-23.
// Authors: Amrik Singh 301296257, Hafiz Shaikh 301282061, Brendan Rodrigues 301119016
//Calculator app v 1.5
// 24/09/2022
// Basic Calculator app in portrait orientation

import UIKit

class ViewController: UIViewController {
    
    // @author : Amrik Singh
    // button container to give round border
    @IBOutlet weak var buttonContainer: UIView!
    
    // @author: Hafiz Shaikh
//    All operator button collection
    @IBOutlet var operatorButtons: [UIButton]!
    
    //@author: Brendan Rodrigues
    
    //empty string for storing values
    var Math:String = ""
    //output result
    @IBOutlet weak var ResultLabel: UILabel!
    
    //appending function for string
    func addtoMath (value: String){
        Math = Math + value
        ResultLabel.text = Math
    }
    // function for numerical input
    @IBAction func Numericals(_ sender: UIButton){
        let button = sender as UIButton
        addtoMath(value: button.titleLabel!.text!)
        }
// function for all clear
    @IBAction func AllClear(_ sender: UIButton) {
        Math = ""
        _ = sender as UIButton
        ResultLabel.text = "0"
    }
    
    //function for backspace
    @IBAction func Backspace(_ sender: UIButton) {
        if (!Math.isEmpty){
            Math.removeLast()
            ResultLabel.text = Math
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // @author: Hafiz Shaikh
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

