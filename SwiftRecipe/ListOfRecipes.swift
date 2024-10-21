//
//  ListOfRecipes.swift
//  SwiftRecipe
//
//  Created by Mark Corbin on 2024-10-19.
//

import SwiftUI

struct Recipe: Identifiable {
    let id = UUID()
    let Title: String
    let Description: String
    let Ingredients: [String]
    let Steps: [String]
    let Image: String
}

struct ListOfRecipes: View {
    @State private var recipes = recipesArray

    var body: some View {
        VStack {
            NavigationView {
                List(recipes) {
                    recipe in NavigationLink(destination: RecipeDetailView(recipeDetail: recipe)) {
                        VStack(alignment: .leading, spacing: 20) {
                            VStack(alignment: .leading) {
                                Text("Recipe:")
                                    .font(.title)
                                    .foregroundColor(.teal)
                                Text(recipe.Title)
                                    .font(.title2)
                                    .foregroundColor(.blue)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .fontWeight(.bold)

                            Image(recipe.Image)
                                .resizable()
                                .frame(width: .infinity, height: 200)
                                .clipped()
                                .shadow(color: .gray, radius: 5, x: 0, y: 5)

                            VStack(alignment: .leading, spacing: 5) {
                                Text("Description:")
                                    .font(.system(size: 22, weight: .medium))
                                Text(recipe.Description)
                                    .font(.system(size: 18, weight: .regular))
                            }
                        }
                    }
                    .padding()
                    .border(Color.black)
                    .background(Color.white)
                    .listRowSeparator(.hidden)
                    .navigationTitle("Recipes")
                } // List End
                .listStyle(PlainListStyle())
            } // Navigation End
        } // VStack End
    }
}

#Preview {
    ListOfRecipes()
}
