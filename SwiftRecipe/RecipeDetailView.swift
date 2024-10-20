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
            Image(recipeDetail.Image)
                .resizable()
                .frame(width: .infinity, height: 350)

            Text(recipeDetail.Title)

            Text(recipeDetail.Description)

            ForEach(recipeDetail.Ingredients, id: \.self) { ingredient in
                Text(ingredient)
            }

            ForEach(recipeDetail.Steps, id: \.self) { step in
                Text(step)
            }
        }

        Spacer()
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
