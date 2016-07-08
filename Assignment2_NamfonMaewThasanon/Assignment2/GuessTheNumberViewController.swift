//
//  GuessTheNumberViewController.swift
//  Assignment2
//
//  Created by Thasanon, Namfon on 7/7/16.
//  Copyright © 2016 maew. All rights reserved.
//

import UIKit

class GuessTheNumberViewController: ViewController {
    // MARK: Declaration
    
    @IBOutlet weak var guessNumberTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additonal setup after loading the view, typicall from a nib
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //Dispose
    }
    
    
    // MAKR: Action
    @IBAction func guessButtonAction(sender: UIButton) {
        let util = Util()
        let answer = arc4random_uniform(11)
        if let guessNumber = util.int32ValueFrom(guessNumberTextField.text){

            if guessNumber == answer {
                resultLabel.text = "Wow! you are lucky! That's the correct answer"
            }else{
                resultLabel.text = "Nope, not the number."
            }
            
        }else{
            resultLabel.text = "Invalid input"
        }

        
        
    }
    
    



}
