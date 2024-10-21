//
//  ListOfRecipes.swift
//  SwiftRecipe
//
//  Created by Mark Corbin on 2024-10-19.
//

import SwiftUI

struct ListOfRecipes: View {
    @State private var recipes = recipesArray

    func addRecipe(_ recipe: Recipe) {
        recipes.append(recipe)
    }

    var body: some View {
        VStack {
            NavigationView {
                VStack {
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

                                AsyncImage(url: URL(string: recipe.Image)) {
                                    image in
                                    image.resizable()
                                        .frame(width: .infinity, height: 200)
                                        .clipped()
                                        .shadow(color: .gray, radius: 5, x: 0, y: 5)
                                } placeholder: {
                                    ProgressView()
                                }

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

                    VStack {
                        NavigationLink(
                            destination: AddRecipe(addRecipe: addRecipe)
                        ) {
                            Text("Add New Recipe")
                                .font(.title2)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                    } //  Add Recipe End
                } // Inside Navigation VStack End
            } // Navigation End
        } // Outside Navigation VStack End
    } // Body View End
}

#Preview {
    ListOfRecipes()
}
