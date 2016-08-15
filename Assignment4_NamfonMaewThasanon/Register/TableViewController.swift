//
//  ViewController.swift
//  Register
//
//  Created by Thasanon, Namfon on 8/1/16.
//  Copyright © 2016 maew. All rights reserved.
//

import UIKit

protocol TableViewControllerDelegate : class {

    func userDidCheckout(checkoutItems : [Product])
}

class TableViewController: UITableViewController {

// MARK : Declaration
    
     var checkoutItems = [Product]()

    
// MARK : Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationController?.navigationBarHidden = false
    }
    
    override func viewWillAppear(animated: Bool) {
        //self.navigationController?.navigationBarHidden = false
    }
    
// MARK : UI tableview datasource
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return checkoutItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("mainCellIdentifier", forIndexPath: indexPath)
        
        let checkoutItem = checkoutItems[indexPath.row]
        cell.textLabel?.text = checkoutItem.title
        cell.detailTextLabel?.text = String(checkoutItem.price)
        cell.imageView?.image = checkoutItem.image
        
        return cell
    }
    
    
    
// MARK : Segue
    @IBAction func addCheckoutItem(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Products", bundle: nil)
        
        if
            let addNavigationController = storyboard.instantiateViewControllerWithIdentifier("ProductNavigationController") as? UINavigationController,
            let addViewController = addNavigationController.topViewController as? AddProductViewController
            
        {
            addViewController.delegate = self
            presentViewController(addNavigationController, animated: true) {
                
            }
        }

    }
    
    // Go to Check out
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "checkoutSegue" {
            if let checkoutViewController = segue.destinationViewController as? CheckoutViewController{
                
                checkoutViewController.checkoutItems = checkoutItems                

            }
            
        }
    }
 
    
    
    
} // end class

extension TableViewController: AddViewControlerDelegate {
    
    func userDidAddProduct(product: Product){
       // append item to checkout array
        checkoutItems.append(product)
       // reload the table view
        tableView.reloadData()
    }

}

/*extension TableViewController: AddCustomViewControllerDelegate {

    func userDidAddNewProduct(product: Product){
        // append item to checkout array
        checkoutItems.append(product)
        // reload the table view
        tableView.reloadData()
}*/

