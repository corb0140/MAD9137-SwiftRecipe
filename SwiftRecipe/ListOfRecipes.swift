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
            Form {
                Section(header: Text("Filter Recipes")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.teal)

                ) {
                    TextField("Name", text: $filterByName)
                }
            }
            .frame(height: 120)
            .padding()

            VStack {
                NavigationView {
                    VStack {
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
                        } //  Add Recipe VStack End
                    } // Inside Navigation VStack End
                } // Navigation End
            } // Outside Navigation VStack End
        } // First VStack end
    } // Body View End
}

#Preview {
    ListOfRecipes()
}
