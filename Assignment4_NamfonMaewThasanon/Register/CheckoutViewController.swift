//
//  CheckoutViewController.swift
//  Register
//
//  Created by Thasanon, Namfon on 8/3/16.
//  Copyright © 2016 maew. All rights reserved.
//

import UIKit

protocol CashViewControllerDelegate: class {
    func userDidCash(checkoutItem: Product)
}

class CheckoutViewController: UIViewController, UITextFieldDelegate{
    // MARK : Declaration
    var checkoutItems: [Product]?
    var totalPrice: Double = 0
    weak var delegate: CashViewControllerDelegate?
    
    @IBOutlet weak var numberOfItemsLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var cashAmountTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cashAmountTextField.delegate = self
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        numberOfItemsLabel.text = String(checkoutItems!.count)
 
        // TotalPrice


        for checkoutItem in checkoutItems! {
            totalPrice += checkoutItem.price
        }
        
        totalAmountLabel.text = String(totalPrice)
    }

    // MARK : Action
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "changeSegue" {
            if let changeViewController = segue.destinationViewController as? ChangeViewController {
                if let cashAmountText = cashAmountTextField.text{
                    changeViewController.cash = Double(cashAmountText)!
                }
                changeViewController.amount = totalPrice
            }
        }
        
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    
}
        


