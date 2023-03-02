//
//  RecipeDetailView.swift
//  RecipeListApp
//
//  Created by Hyden Polikoff on 2/23/23.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    
    var body: some View {
        
        ScrollView {
            Image(recipe.image)
                .resizable()
                .scaledToFill()
                .cornerRadius(5)
                .padding(.all)
            VStack(alignment: .leading) {
                Text("Ingredients").font(.headline)
                
                ForEach (recipe.ingredients) { item in
                    Text("- " + item.name)
                }
            }
            
            VStack(alignment: .leading) {
                Text("Directions")
                
                ForEach(0..<recipe.directions.count, id: \.self) {i in
                    Text(String(i+1) + " " + recipe.directions[i])
                }
            }
        }
        .navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
