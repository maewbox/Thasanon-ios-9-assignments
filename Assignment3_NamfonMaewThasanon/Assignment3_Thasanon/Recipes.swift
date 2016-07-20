//
//  Recipes.swift
//  Assignment3_Thasanon
//
//  Created by Thasanon, Namfon on 7/18/16.
//  Copyright © 2016 maew. All rights reserved.
//

import Foundation
import UIKit

class Recipe {

    let name: String
    let cuisine: String
    let cookingTime: String
    let description: String
    let ingredients: [String]
    let steps: [String]
    let recipeImage: UIImage
    
    
    init(name: String, cuisine: String, cookingTime: String, description: String, ingredients: [String], steps: [String], recipeImage: UIImage){
        self.name = name
        self.cuisine = cuisine
        self.cookingTime = cookingTime
        self.description = description
        self.ingredients = ingredients
        self.steps = steps
        self.recipeImage = recipeImage

    }
}
