//
//  MainListTableTableViewController.swift
//  Assignment3_Thasanon
//
//  Created by Thasanon, Namfon on 7/18/16.
//  Copyright © 2016 maew. All rights reserved.
//

import UIKit

class MainListTableTableViewController: UITableViewController {
    
    // MARK: Declaration
    private var recipesFull = [Recipe]()

    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

    var recipes = [
        Recipe(name: "Margarita Grilled Shrimp", cuisine: "Mexican", cookingTime: "15 minutes", description: "The shrimp can be marinated up to 3 hours before grilling. The amount of red pepper used can be adjusted according to how hot you like it. The marinade is also great on chicken.", ingredients: ["1 pound shrimp, peeled and deveined", "1 pound shrimp, peeled and deveined", "3 tablespoons chopped fresh cilantro"], steps: ["Stir shrimp, olive oil, cilantro, lime juice, garlic, tequila, cayenne pepper, and salt together in a bowl. Cover the bowl with plastic wrap and refrigerate shrimp in marinade for 30 minutes.", "Preheat an outdoor grill for high heat and lightly oil grate.", "Remove shrimp from bowl and thread onto skewers; discard marinade.", "Cook on the preheated grill until shrimp turn pink, 2 to 3 minutes per side."],
            recipeImage: UIImage(named: "grilledShrimp")!),
        
        Recipe(name: "Italian Chicken Marinade", cuisine: "Italian", cookingTime: "15 minutes", description: "This is a simple but delicious way of marinating your chicken.",
            ingredients: ["1 (16 ounce) bottle Italian-style salad dressing", "1 teaspoon garlic powder", "1 teaspoon salt", "4 skinless, boneless chicken breast halves"]
            , steps: ["In a shallow baking dish, mix the salad dressing, garlic powder, and salt. Place the chicken in the bowl, and turn to coat. Marinate in the refrigerator at least 4 hours. (For best results, marinate overnight.)",
            "Preheat the grill for high heat.",
            "Lightly oil grate. Discard marinade, and grill chicken 8 minutes on each side, or until juices run clear."
            ],
            recipeImage: UIImage(named: "marinateChicken")!)
        
        ]
        recipesFull.appendContentsOf(recipes)
    }
    

    // MARK: UITableViewDataSource
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipesFull.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("mainCellIdentifier", forIndexPath: indexPath)
        
        let recipeItem = recipesFull[indexPath.row]
        cell.textLabel?.text = recipeItem.name
        cell.detailTextLabel?.text = recipeItem.cuisine
        
        return cell
    }
    
    // MARK: Segue
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let detailviewController = segue.destinationViewController as? DetailViewController {
            if let indexPath = tableView.indexPathForSelectedRow{
                let recipe = recipesFull[indexPath.row]
                detailviewController.recipe = recipe
            }
        }
    }
    
    
}
   


