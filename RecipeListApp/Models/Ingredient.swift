//
//  Ingredient.swift
//  RecipeListApp
//
//  Created by Hyden Polikoff on 3/2/23.
//

import Foundation


class Ingredient: Identifiable, Decodable {
    
    var id:UUID?
    var name:String
    var num:Int?
    var denom:Int?
    var unit:String?
    
}
