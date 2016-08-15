//
//  change.swift
//  Register
//
//  Created by Thasanon, Namfon on 8/10/16.
//  Copyright © 2016 maew. All rights reserved.
//

import UIKit

class ChangeViewController: UIViewController {
    var cash: Double = 0
    var amount: Double = 0
    
    @IBOutlet weak var changeAmount: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        let change = cash - amount
        changeAmount.text = "$"+String(change)
        
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "registerSegue" {
            if let registerViewController = segue.destinationViewController as? TableViewController {
                registerViewController.checkoutItems.removeAll()
            }
        }
    }

    
    


}
