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
    @State private var showAddRecipeView: Bool = false

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
        ZStack {
            // Navigation View
            NavigationView {
                Form {
                    Section(header: Text("Filter Recipes")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.teal)
                                
                    ) {
                        // Filter Recipes
                        TextField("Recipe Name", text: $filterByName)
                    }
                    .frame(height: 10)
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
                            .padding()
                        }
                        .navigationTitle("Recipes")
                    } // List End
                } // Form End
            } // Navigation End
            
            // Add Recipe Navigation Link
            Button {
                showAddRecipeView = true
            } label: {
                Spacer()
                
                Image(systemName: "plus.circle")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .accentColor(.blue)
                
                Spacer()
            }
            .background(Color.clear)
            .padding()
            .sheet(isPresented: $showAddRecipeView) {
                AddRecipe(
                    addRecipe: addRecipe,
                    showAddRecipeView: $showAddRecipeView
                )
            }
            .position(x: 350, y: 0)
        } // VStack End
    } // Body View End
}

#Preview {
    ListOfRecipes()
}
