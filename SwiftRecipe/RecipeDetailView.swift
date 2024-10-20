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
        VStack(alignment: .leading) {
            VStack {
                Image(recipeDetail.Image)
                    .resizable()
                    .frame(width: .infinity, height: 350)
            }

            VStack(alignment: .leading, spacing: 10) {
                Text(recipeDetail.Title)

                Text(recipeDetail.Description)

                VStack(alignment: .leading) {
                    Text("Ingredients:")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                        .textCase(.uppercase)

                    HStack(spacing: 5) {
                        ForEach(
                            recipeDetail.Ingredients.indices,
                            id: \.self
                        ) { index in
                            let ingredient = recipeDetail.Ingredients[index]
                            let isLast = index == recipeDetail.Ingredients.count - 1
                            Text("\(ingredient)\(isLast ? "." : ",")")
                        }
                        .font(.system(size: 20))
                    }
                    .offset(y: 5)
                }

                VStack(alignment: .leading) {
                    Text("Steps:")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                        .textCase(.uppercase)

                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(recipeDetail.Steps.indices, id: \.self) { index in
                            let step = recipeDetail.Steps[index]
                            Text("\(index + 1). \(step)")
                        }
                        .font(.system(size: 20))
                    }
                    .offset(y: 5)
                }

                .padding(.top)
            }
            .padding()
        }

        Spacer()
    }
}

#Preview {
    RecipeDetailView(
        recipeDetail: Recipe(  Title: "Italian Cloud Eggs",
                               Description: "These cloud-like eggs offer you the breakfast of your dreams.",
                               Ingredients: ["Eggs", "Italian Seasoning", "Basil", "Salt", "Pepper"],
                               Steps: ["Preheat oven to 450º", "Beat eggs, italian seasoing, salt and pepper in bowl", "put in a iron skillet and bake for 5 minutes"],
                               Image: "Italian-Cloud_Eggs")
    )
}
