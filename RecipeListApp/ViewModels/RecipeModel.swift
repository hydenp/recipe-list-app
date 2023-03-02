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
}
