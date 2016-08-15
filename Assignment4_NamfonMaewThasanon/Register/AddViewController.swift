//
//  AddViewController.swift
//  Register
//
//  Created by Thasanon, Namfon on 8/15/16.
//  Copyright © 2016 maew. All rights reserved.
//

import UIKit

protocol AddCustomViewControllerDelegate: class {

    func userDidAddNewItem (product : Product)

}

class AddViewController : UIViewController{

    // MARK : Declaration
    var product = [Product]()
    
    weak var delegate: AddCustomViewControllerDelegate?
    
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!

    // MARK : Life Cycle
    @IBAction func addButtonAction(sender: AnyObject) {
        
        let title = titleTextField.text
        var price: Double = 0
        if let priceStr = priceTextField.text{
            price = Double(priceStr)!
        }
        let productImg = UIImage(named: "unknown")
        
        let selectedItem = Product(title: title!, price: price, image: productImg!)
        passingData(selectedItem)
    }
    
    func passingData(product: Product) {
        delegate?.userDidAddNewItem(product)
        dismissViewControllerAnimated(true, completion: nil)
    
    }



}

