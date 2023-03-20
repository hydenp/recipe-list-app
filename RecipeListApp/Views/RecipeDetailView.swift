//
//  RecipeDetailView.swift
//  RecipeListApp
//
//  Created by Hyden Polikoff on 2/23/23.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    @State var selectServingSize = 2
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading) {
                
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                //                .cornerRadius(5)
                //                .padding(.all)
                
                VStack(alignment: .leading) {
                    Text("Select your serving size")
                    Picker("", selection: $selectServingSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 160)
                }
                .padding()
                
                Divider()
                    .padding(.horizontal)
                
                
                VStack(alignment: .leading) {
                    Text("Ingredients").font(.headline)
                    
                    ForEach (recipe.ingredients) { item in
                        Text("- " + RecipeModel.getPortion(ingredient: item, recipeServings: recipe.servings, targetServings: selectServingSize) + " " + item.name)
                    }
                }
                .padding(.horizontal)
                
                Divider()
                    .padding(.horizontal)
                
                VStack(alignment: .leading) {
                    Text("Directions").font(.headline)
                    
                    ForEach(0..<recipe.directions.count, id: \.self) {i in
                        Text(String(i+1) + " " + recipe.directions[i])
                    }
                }
                .padding(.horizontal)
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
