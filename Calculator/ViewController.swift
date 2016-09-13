//
//  ViewController.swift
//  Calculator
//
//  Created by Rama Milaneh on 9/9/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        screen.text=""
      
    }

    var result:Double = 0
    var operation=""
    var done:Bool = false
    var memory=""
    
    func addNumberToScreen(number:String){
       if screen.text == "+"{
            screen.text = ""
            screen.text! += number
        }else if screen.text == "-"{
            screen.text=""
            screen.text! += number
       }else if screen.text == "*"{
        screen.text=""
        screen.text! += number
       }else if screen.text == "/"{
        screen.text=""
        screen.text! += number
       }else if screen.text == "!"{
        screen.text=""
        screen.text! += number
       }else if screen.text == "sqrt"{
        screen.text=""
        screen.text! += number
        }else if screen.text == "%"{
            screen.text=""
            screen.text! += number
        }
       else {
        screen.text! += number
        }
    }
    func performOperation(){
        switch(operation){
            case "+":
            result = result + (screen.text! as NSString).doubleValue
            case "-":
            result = result - (screen.text! as NSString).doubleValue
            case "*":
            result = result * (screen.text! as NSString).doubleValue
            case "/":
                result = result / (screen.text! as NSString).doubleValue
            case "!":
                let n = Int(result + (screen.text! as NSString).doubleValue)
                var value = n
                for i in 1...Int(n - 1){
                    value = value * (n-i)
                  }
            result =  Double(value)
            case "sqrt":
            result = sqrt(result + (screen.text! as NSString).doubleValue)
            case "%":
            result = (result + (screen.text! as NSString).doubleValue)/100
            case "":
                result = result + (screen.text! as NSString).doubleValue
        default:
            print("Invalid operation")
            
        }
    }

     @IBOutlet weak var screen: UILabel!
    
    @IBAction func numbers(sender: AnyObject) {
        if done{
            screen.text=""
            if let title = (sender.currentTitle!){
              addNumberToScreen(title)
                done=false
            }
        }else{
            if let title = (sender.currentTitle){
                if let title = title{
            addNumberToScreen(title)
            }
            }
        }
    }
    
    @IBAction func operation(sender: AnyObject) {
        performOperation()
        if let operations = sender.currentTitle {
            if let operations = operations{
                screen.text = operations
                operation = operations
            }
        }
}
    
    @IBAction func changeSign(sender: AnyObject) {
       let value = ((screen.text! as NSString).doubleValue)*(-1)
        screen.text = String(value)
        
    }
    @IBAction func equal(sender: AnyObject) {
        performOperation()
        screen.text=String(result)
        operation=""
        result=0
        done=true
    }
    
    @IBAction func clear(sender: AnyObject) {
        screen.text=""
    }
    
    @IBAction func addToMemory(sender: AnyObject) {
        memory = screen.text!
    }
    
    @IBAction func clearMemory(sender: AnyObject) {
        memory=""
    }
    
    @IBAction func displayMemoryOnScreen(sender: AnyObject) {
        screen.text=memory
    }
    
   }

