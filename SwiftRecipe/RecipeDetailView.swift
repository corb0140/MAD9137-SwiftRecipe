//
//  RecipeDetailView.swift
//  SwiftRecipe
//
//  Created by Mark Corbin on 2024-10-19.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipeDetail: Recipe
//    @State var count = 0

    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                Image(recipeDetail.Image)
                    .resizable()
                    .frame(width: .infinity, height: 350)
            }

            VStack(alignment: .leading, spacing: 10) {
                Text(recipeDetail.Title)

                Text(recipeDetail.Description)

                HStack {
                    ForEach(recipeDetail.Ingredients, id: \.self) { ingredient in
                        Text(ingredient)
                    }
                }

                VStack(alignment: .leading) {
                    Text("Steps:")
                        .font(.title)
                        .fontWeight(.bold)

                    ForEach(recipeDetail.Steps.indices, id: \.self) { index in
                        Text("\(index + 1). \(recipeDetail.Steps[index])")
                    }
                }
            }
            .padding()
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
