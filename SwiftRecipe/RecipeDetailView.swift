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
            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    Text(recipeDetail.Title)
                        .font(.title)
                        .fontWeight(.bold)
                        .textCase(.uppercase)
                        .foregroundColor(.teal)
                    
                    VStack(alignment: .leading) {
                        Text("Description:")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                            .textCase(.uppercase)
                        
                        Text(recipeDetail.Description)
                            .font(.system(size: 20))
                            .offset(y: 5)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Ingredients:")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                            .textCase(.uppercase)
                        
                        HStack(alignment: .top, spacing: 5) {
                            ForEach(
                                recipeDetail.Ingredients.indices,
                                id: \.self
                            ) { index in
                                let ingredient = recipeDetail.Ingredients[index]
                                let isLast = index == recipeDetail.Ingredients.count - 1
                                Text("\(ingredient)\(isLast ? "." : ",")")
                            }
                            .font(.system(size: 20))
                            .fixedSize(horizontal: true, vertical: false)
                        }
                        .offset(y: 5)
                    }
                    .padding(.top)
                    
                    VStack(alignment: .leading) {
                        Text("Steps:")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                            .textCase(.uppercase)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            ForEach(recipeDetail.Steps.indices, id: \.self) { index in
                                let step = recipeDetail.Steps[index]
                                
                                HStack(alignment: .top) {
                                    Text("\(index + 1).")
                                    Text("\(step)")
                                }
                                .font(.system(size: 20))
                            }
                        }
                        .offset(y: 5)
                    } // VStack end for steps
                    .padding(.top)
                } // VStack end for Info
                .padding()
            } // Scrollview End
        } // First VStack end
        Spacer()
    }
}

#Preview {
    RecipeDetailView(
        recipeDetail: Recipe(Title: "Ham and Swiss Omelet",
                             Description: "This omelet will put pep in your step all morning long.",
                             Ingredients: ["Eggs", "Ham", "Swiss Cheese"],
                             Steps: ["Make the eggs", "fill egg with ham and cheese", "Fold egg over the filling"],
                             Image: "Ham-and-Swiss")
    )
}
