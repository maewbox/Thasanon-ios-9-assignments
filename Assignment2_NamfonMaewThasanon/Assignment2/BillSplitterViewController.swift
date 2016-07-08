//
//  BillSplitterViewController.swift
//  Assignment2
//
//  Created by Thasanon, Namfon on 7/6/16.
//  Copyright © 2016 maew. All rights reserved.
//

import UIKit

class BillSplitterViewController : UIViewController {
    //MARK: Declaration
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipPercentageTextField: UITextField!
    @IBOutlet weak var numberOfSplitTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose
    }
    
    
    //MARK: Action
    @IBAction func splitButtonAction(sender: UIBarButtonItem){
        let util = Util()

        if  let billAmount = util.doubleValueFrom(billAmountTextField.text),
            let tipPercentage = util.doubleValueFrom(tipPercentageTextField.text),
            let numberOfSplit = util.doubleValueFrom(numberOfSplitTextField.text) {
        
                let bs = BillSplitter()
                let tipAmount = bs.calculateTip(billAmount, percentTip: tipPercentage)
                let totalAmount = bs.totlaAmount(billAmount, tipAmount: tipAmount)
                tipLabel.text = "tips: $\(tipAmount)"
                totalLabel.text = "total: $\(totalAmount)"
                let result = bs.spitByPeopleNum(totalAmount, peopleNum: numberOfSplit)
                resultLabel.text = "Amount per person: $\(result)"
            
        }else {
            resultLabel.text = "Invalid Input values"
            
        }
        
    }
    

}