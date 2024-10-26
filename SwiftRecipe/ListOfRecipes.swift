//
//  ListOfRecipes.swift
//  SwiftRecipe
//
//  Created by Mark Corbin on 2024-10-19.
//

import SwiftUI

struct ListOfRecipes: View {
    @State private var recipes = recipesArray
    @State private var filterByName: String = ""

    func addRecipe(_ recipe: Recipe) {
        recipes.append(recipe)
    }

    func deleteRecipe(_ recipe: Recipe) {
        recipes = recipes.filter { $0.id != recipe.id }
    }

    var filteredRecipes: [Recipe] {
        if filterByName.isEmpty {
            return recipes
        } else {
            return recipes
                .filter { $0.Title.localizedStandardContains(filterByName) }
        }
    }

    var body: some View {
        VStack {
            // Navigation View
            NavigationView {
                VStack {
                    Form {
                        Section(header: Text("Filter Recipes")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.teal)

                        ) {
                            // Filter Recipes
                            TextField("Recipe Name", text: $filterByName)
                        }
                    }
                    .frame(height: 120)
                    .padding()

                    // List of Recipes
                    List(filteredRecipes) {
                        recipe in NavigationLink(
                            destination: RecipeDetailView(
                                recipeDetail: recipe,
                                delete: {
                                    deleteRecipe(recipe)
                                }
                            )
                        ) {
                            VStack(alignment: .leading, spacing: 20) {
                                // Title
                                Text(recipe.Title)
                                    .font(.title2)
                                    .foregroundColor(.blue)
                                    .fontWeight(.bold)

                                // Image
                                AsyncImage(url: URL(string: recipe.Image)) {
                                    image in
                                    image.resizable()
                                        .frame(width: .infinity, height: 200)
                                        .clipped()
                                        .shadow(color: .gray, radius: 5, x: 0, y: 5)
                                } placeholder: {
                                    ProgressView()
                                }

                                // Description
                                Text(recipe.Description)
                                    .font(.system(size: 18, weight: .regular))
                            }
                        }
                        .padding()
                        .border(Color.black)
                        .background(Color.white)
                        .listRowSeparator(.hidden)
                        .navigationTitle("Recipes")
                    } // List End
                    .listStyle(PlainListStyle())

                    // Add Recipe Navigation Link
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
                    }
                } // Inside Navigation VStack End
            } // Navigation End
        } // Outside Navigation VStack End
    } // Body View End
}

#Preview {
    ListOfRecipes()
}
