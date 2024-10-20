//
//  RecipeDetailView.swift
//  SwiftRecipe
//
//  Created by Mark Corbin on 2024-10-19.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipeDetail: Recipe

    var body: some View {
        VStack {
            Text(recipeDetail.Title)
        }
    }
}

#Preview {
    RecipeDetailView(
        recipeDetail: Recipe(Title: "Ham and Swiss Omelet",
                             Description: "This omelet will put pep in your step all morning long.",
                             Ingredients: ["Eggs", "Ham", "Swiss Cheese"],
                             Steps: ["Make the eggs", "fill egg with ham and cheese", "Fold egg over the filling"], Image: "Banana-Oatmeal-Pancakes")
    )
}
