//
//  AddProductViewController.swift
//  Register
//
//  Created by Thasanon, Namfon on 8/1/16.
//  Copyright © 2016 maew. All rights reserved.
//

import UIKit

protocol AddViewControlerDelegate: class {
    func userDidAddProduct(product: Product)
}

class AddProductViewController: UIViewController {

    // MARK : Declaration
    var product = [Product]()
    
    weak var delegate: AddViewControlerDelegate?
    @IBOutlet weak var prod1Button: UIButton!
    @IBOutlet weak var prod2Button: UIButton!
    @IBOutlet weak var prod3Button: UIButton!
    @IBOutlet weak var prod4Button: UIButton!
    @IBOutlet weak var prod5Button: UIButton!
    
    
    @IBAction func addMoreProduct(sender: AnyObject) {
    }
    

    
    
    // MARK : Action


    @IBAction func cancelButtonAction(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func selectButtonProduct1Action(sender: AnyObject) {
        let title = "MICHELE Women's 16 Diamond"
        let price = 1195.00
        guard
            let productImg = prod1Button.imageView else
        {
            return
        }
        let selectedItem = Product(title: title, price: price, image: (productImg.image)!)
        passingData(selectedItem)
    }

    @IBAction func selectButtonProduct2Action(sender: AnyObject) {

            let title = "MRaymond Weil Women's 'Tango' Swiss Quartz "
            let price = 995.00
            guard
                let productImg2 = prod2Button.imageView else
            {
                return
            }
            let selectedItem = Product(title: title, price: price, image: (productImg2.image)!)
            passingData(selectedItem)
    }
    
    @IBAction func selectButtonProduct3Action(sender: AnyObject) {
        
            let title = "Cartier Men's W31074M7 Pasha C"
            let price = 5604.72
            guard
                let productImg3 = prod3Button.imageView else
            {
                return
        }
        let selectedItem = Product(title: title, price: price, image: (productImg3.image)!)
        passingData(selectedItem)
    }

    @IBAction func selectButtonProduct4Action(sender: AnyObject) {
        
        let title = "TAG Heuer Women's CAH1211.BA0863 "
        let price = 1275.00
        guard
            let productImg4 = prod4Button.imageView else
        {
            return
        }
        let selectedItem = Product(title: title, price: price, image: (productImg4.image)!)
        passingData(selectedItem)
    }
    
    @IBAction func selectButtonProduct5Action(sender: AnyObject) {
        
        let title = "TAG Heuer Men's 'Aquaracr' Swiss Automatic"
        let price = 3738.80
        guard
            let productImg5 = prod5Button.imageView else
        {
            return
        }
        let selectedItem = Product(title: title, price: price, image: (productImg5.image)!)
        passingData(selectedItem)
    }
    
    
    
    func passingData(product: Product){

        delegate?.userDidAddProduct(product)
        dismissViewControllerAnimated(true, completion: nil)
    }

}

