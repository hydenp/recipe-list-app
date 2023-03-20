//
//  RecipeModel.swift
//  RecipeListApp
//
//  Created by Hyden Polikoff on 2/23/23.
//

import Foundation


class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        self.recipes = DataService.getLocalData()
    }
    
    static func getPortion(ingredient:Ingredient, recipeServings:Int, targetServings:Int) -> String {
        
        var portion = ""
        var wholePortions = 0
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        
        if ingredient.num != nil {
            // Get single serving size
            denominator *= recipeServings
            // Get target portion
            numerator *= targetServings
            
            // Reduce Fraction
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            
            // Get whole portion
            if numerator >= denominator {
                wholePortions = numerator / denominator
                numerator = numerator % denominator
                
                portion += String(wholePortions)
            }
            
            // Express remainder
            if numerator > 0 {
                portion += wholePortions > 0 ? " " : ""
                portion += "\(numerator)/\(denominator)"
            }
        }
        
        if var unit = ingredient.unit {
            
            // Check if pluralization needed
            if wholePortions > 1 || (wholePortions == 1 && numerator != 0) {
                if unit.suffix(2) == "ch" {
                    unit += "es"
                } else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast())
                    unit += "ves"
                } else {
                    unit += "s"
                }
            }
            
            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            return portion + unit
        }
        
        return portion
    }
}
