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
import Foundation

class ViewController: UIViewController {
    
    // @author : Amrik Singh
    // button container to give round border
    @IBOutlet weak var buttonContainer: UIView!
    
    // @author: Hafiz Shaikh
//    All operator button collection
    @IBOutlet var operatorButtons: [UIButton]!
    
    //@author: Brendan Rodrigues
    
    var leftside: Float = 0.0
    var rightside: Float = 0.0
    var result: Float = 0.0
    
    var activeOperator: String = ""
    var haveLeftHandSide: Bool = false
    var haveRightHandSide: Bool = false
    var resultLabelReady: Bool = true
    
    
    //output result
    @IBOutlet weak var ResultLabel: UILabel!
    
    
    
    // function for numerical input
    @IBAction func Numericals(_ sender: UIButton){
        let button = sender as UIButton
   
        let btnTxt = button.titleLabel?.text
        
        if(!resultLabelReady)
        {
            ResultLabel.text = "0"
            resultLabelReady = true
        }
        
        switch(btnTxt)
        {
        case "." :
            if(!ResultLabel.text!.contains("."))
            {
                ResultLabel.text?.append(".")
            }
        default :
            if(ResultLabel.text == "0")
            {
                ResultLabel.text = btnTxt
            }
            else{
                ResultLabel.text?.append(btnTxt!)
            }
        }
        }
    
    //function for backspace button
    @IBAction func ClearBtns(_ sender: UIButton) {
        let button = sender as UIButton
        _ = button.titleLabel?.text
        
        leftside = 0.0
        rightside = 0.0
        haveLeftHandSide = false
        haveRightHandSide = false
        resultLabelReady = true
        activeOperator = ""
        
        if(ResultLabel.text!.count == 1)
        {
            ResultLabel.text = "0"
        }
        else
        {
            ResultLabel.text?.removeLast()
        }
    }
    
    // function for all clear
    @IBAction func AllClear(_ sender: UIButton) {
        leftside = 0.0
        rightside = 0.0
        haveLeftHandSide = false
        haveRightHandSide = false
        resultLabelReady = true
        activeOperator = ""
        
        ResultLabel.text = "0"
    }
    
    
    @IBAction func EqualToBtn(_ sender: UIButton){
        
        let button = sender as UIButton
        let btnText = button.titleLabel?.text
        
        
        if(!haveLeftHandSide)
        {
            leftside = Float(ResultLabel.text!)!
            haveLeftHandSide = true
            resultLabelReady = false
        }
        else
        {
            rightside = Float(ResultLabel.text!)!
            haveRightHandSide = true
            resultLabelReady = false
        }
        
        if(haveLeftHandSide && haveRightHandSide)
        {
            Evaluate()
        }
        else {
            if((!haveLeftHandSide)  && (ResultLabel.text  != "0"))
            {
                leftside = Float(ResultLabel.text!)!
                haveLeftHandSide = true
                
            }
            else if(haveLeftHandSide)
            {
                rightside = Float(ResultLabel.text!)!
                haveRightHandSide = true
            }
        }
        
        switch(btnText)
        {
        case "+":
            print(btnText as Any)
            activeOperator = "+"
            ResultLabel.text = "+"
            print(leftside)
            print(rightside)
        case "-":
            activeOperator = "-"
            ResultLabel.text = "-"
        case "x":
            activeOperator = "x"
            ResultLabel.text = "x"
        case "/":
            activeOperator = "/"
            ResultLabel.text = "/"
        case "%":
            activeOperator = "%"
            ResultLabel.text = "%"
        case "sqrt":
            activeOperator = "sqrt"
            ResultLabel.text = "√"
        case "cbrt":
            activeOperator = "cbrt"
            ResultLabel.text = "∛"
        case "1/X":
            activeOperator = "1/X"
            ResultLabel.text = "1/"
        case "Sin":
            activeOperator = "Sin"
            ResultLabel.text = "Sin"
        case "Cos":
            activeOperator = "Cos"
            ResultLabel.text = "Cos"
        case "Tan":
            activeOperator = "Tan"
            ResultLabel.text = "Tan"
        case "Log":
            activeOperator = "Log"
            ResultLabel.text = "Log"
        case "(":
            activeOperator = "("
            ResultLabel.text = "("
        case ")":
            activeOperator = ")"
            ResultLabel.text = ")"
        case "^":
            activeOperator = "^"
            ResultLabel.text = "^"
        case "=":
            if(haveLeftHandSide && haveRightHandSide)
            {
                Evaluate()
            }
        default:
           print("Not Implimented")
        }
        
    }
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // @author: Hafiz Shaikh
        operatorButtons.forEach{(button) in
            
            // added round corners to Button Container
            buttonContainer.layer.cornerRadius=32
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

    
    @IBAction func e(_ sender: UIButton) {
        let button = sender as UIButton
        ResultLabel.text = button.subtitleLabel!.text
    }
    
    @IBAction func Log_e(_ sender: UIButton) {
        let button = sender as UIButton
        ResultLabel.text = button.titleLabel!.text
    }
    
    
    @IBAction func BtnPlusMinus(_ sender: UIButton) {
     
        if(!ResultLabel.text!.contains("-")){
            let num = "-" + ResultLabel.text!
            print(num)
            
            ResultLabel.text = num
//            ResultLabel.text?.append("-")
        }
    }
    
    func Add(_ leftside: Float, _ rightside: Float) -> Float
    {
        return leftside + rightside
    }
    
    func Subtract(_ leftside: Float, _ rightside: Float) -> Float
    {
        return leftside - rightside
    }
    
    func Multiply(_ leftside: Float, _ rightside: Float) -> Float
    {
        return leftside * rightside
    }
    
    func Divide(_ leftside: Float, _ rightside: Float) -> Float
    {
        return leftside / rightside
    }
    
    func Percent(_ leftside: Float, _ rightside: Float) -> Float
    {
        return leftside * 0.01 * rightside
    }
    
    func Root(_ rightside: Float) -> Float
    {
        return sqrt(rightside)
    }
    
    func CubeRoot(_ rightside: Float) -> Float
    {
        return cbrt(rightside)
    }
    
    func Reciprocal(_ rightside: Float) -> Float
    {
        return (1 / rightside)
    }
    
    func Sine(_ rightside: Float) -> Float
    {
        return sin((rightside * 3.14159265) / 180)
    }
    
    func Cosine(_ rightside: Float) -> Float
    {
        return cos((rightside * 3.14159265) / 180)
    }
    
    func Tangent(_ rightside: Float) -> Float
    {
        return tan((rightside * 3.14159265) / 180)
    }

    func Log10(_ rightside: Float) -> Float
    {
        return log10(rightside)
    }
    
    func Sq(_ leftside: Float, _ rightside: Float) -> Float
    {
        return pow(leftside, rightside)
    }
    
    func Evaluate(){
   
        switch(activeOperator)
        {
        case "+":
            result = Add(leftside,rightside)
//            ResultLabel.text = String(Add(leftside,rightside))
        case "-":
            result = Subtract(leftside,rightside)
//            ResultLabel.text = String(Subtract(leftside, rightside))
        case "x":
            result = Multiply(leftside,rightside)
//            ResultLabel.text =  String(Multiply(leftside, rightside))
        case "/":
            result = Divide(leftside,rightside)
//            ResultLabel.text =  String(Divide(leftside, rightside))
        case "%" :
            result = Percent(leftside,rightside)
//            ResultLabel.text = String(Percentage(leftside, rightside))
        case "sqrt":
            result = Root(rightside)
//            ResultLabel.text = String(SqRoot(rightside))
        case "cbrt":
            result = CubeRoot(rightside)
//            ResultLabel.text = String(CbRoot(rightside))
        case "1/X":
            result = Reciprocal(rightside)
//            ResultLabel.text = String(Reciprocal(rightside))
        case "Sin":
            result = Sine(rightside)
//            ResultLabel.text = String(Sine(rightside))
        case "Cos":
            result = Cosine(rightside)
//            ResultLabel.text = String(Cosine(rightside))
        case "Tan":
            result = Tangent(rightside)
//            ResultLabel.text = String(Tangent(rightside))
        case "Log":
            result = Log10(rightside)
//             ResultLabel.text = String(Log(rightside))
        case "^":
            result = Sq(leftside, rightside)
//  ResultLabel.text = String(^(rightside))
        default:
            result = 0.0
        }
        ResultLabel.text = String(result)
        leftside = result
        rightside = 0.0
        haveLeftHandSide = true
        haveRightHandSide = false
        resultLabelReady = false
        activeOperator = ""
    }
    
    
}

