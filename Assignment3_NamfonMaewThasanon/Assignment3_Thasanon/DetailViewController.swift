//
//  DetailViewController.swift
//  Assignment3_Thasanon
//
//  Created by Thasanon, Namfon on 7/18/16.
//  Copyright © 2016 maew. All rights reserved.
//

import Foundation
import UIKit

protocol HowToMake : class{
    var ingredients: [String] {get set}
    var steps: [String] {get set}
    
}


class DetailViewController: UIViewController {
    

    // MARK: Declaration
    
        weak var howToMakeFood : HowToMake?
    
    var recipe: Recipe?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cookingTimeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var foodImageView: UIImageView!
    
    // MARK: Lifecycle
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let recipe = recipe {
            nameLabel.text = recipe.name
            cookingTimeLabel.text = recipe.cookingTime
            descriptionLabel.text = recipe.description
            foodImageView.image = recipe.recipeImage
        
        }
        
        howToMakeFood?.ingredients = (recipe?.ingredients)!
        howToMakeFood?.steps = (recipe?.steps)!
    }
    
    
    

}