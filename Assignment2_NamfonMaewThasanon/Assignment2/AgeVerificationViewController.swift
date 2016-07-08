//
//  AgeVerificationViewController.swift
//  Assignment2
//
//  Created by Thasanon, Namfon on 7/6/16.
//  Copyright © 2016 maew. All rights reserved.
//

import UIKit

class AgeVerificationViewController: UIViewController {

    // MARK: Declaration
    @IBOutlet weak var yearBornTextField: UITextField!
    @IBOutlet weak var ageOutputLabel: UILabel!
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: Actions

    @IBAction func verificationBtnAction(sender: UIButton) {
        let util = Util()
        if let yearBorn = util.intValueFrom(yearBornTextField.text){
            
            let ag = AgeVerification()
            let age = ag.calculateAge(yearBorn)
            let result = ag.verifyAge(age)
            
            ageOutputLabel.text = "\(result)"
            
        }else {
            ageOutputLabel.text = "Invalid Input"
        }

    
    }
    

}

