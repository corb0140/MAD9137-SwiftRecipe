//
//  ListOfRecipes.swift
//  SwiftRecipe
//
//  Created by Mark Corbin on 2024-10-19.
//

import SwiftUI

struct ListOfRecipes: View {
    @EnvironmentObject var recipes: RecipeList
    @State private var filterByName: String = ""
    @State private var showAddRecipeView: Bool = false
    @State private var placeHolderImage: String = "https://archive.org/download/placeholder-image/placeholder-image.jpg"
    
    var filteredRecipes: [Recipe] {
        if filterByName.isEmpty {
            return recipes.recipesArray
        } else {
            return recipes.recipesArray
                .filter { $0.Title.localizedStandardContains(filterByName) }
        }
    }
    
    private let flexibleColumn = [
        GridItem(.flexible(minimum: 100, maximum: 200)),
        GridItem(.flexible(minimum: 100, maximum: 200))
    ]
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            // Navigation View
            NavigationView {
                VStack {
                    HStack(spacing: 20) {
                        Spacer()
                        
                        VStack {
                            Image("icons8-smoothie-64")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .clipped()
                            
                            Text("All")
                        }
                        
                        VStack {
                            Image("icons8-leaves-48")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .clipped()
                            
                            Text("Vegan")
                        }
                        
                        VStack {
                            Image("icons8-protein-48")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .clipped()
                            
                            Text("Protein")
                        }
                        
                        VStack {
                            Image("icons8-leaf-48")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .clipped()
                            
                            Text("Green")
                        }
                        
                        VStack {
                            Image("icons8-energy-48")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .clipped()
                            
                            Text("Energy")
                        }
                        
                        Spacer()
                    }
                    .padding()
                    
                    ScrollView {
                        // grid List
                        LazyVGrid(columns: flexibleColumn, spacing: 10) {
                            ForEach(filteredRecipes, id: \.self) {
                                recipe in NavigationLink(
                                    destination: RecipeDetailView(
                                        recipeDetail: recipe,
                                        delete: { _ in
                                            recipes.deleteRecipe(recipe)
                                        }
                                    )
                                ) {
                                    VStack {
                                        ZStack {
                                            // Image
                                            if !recipe.Image.isEmpty {
                                                AsyncImage(url: URL(string: recipe.Image)) {
                                                    image in
                                                    image.resizable()
                                                        .frame(width: .infinity, height: 150, alignment: .topLeading)
                                                        .clipped()
                                                    
                                                } placeholder: {
                                                    ProgressView()
                                                }
                                            } else {
                                                AsyncImage(
                                                    url: URL(string: placeHolderImage)
                                                ) {
                                                    image in
                                                    image.resizable()
                                                        .frame(width: .infinity, height: 100)
                                                        .clipped()
                                                } placeholder: {
                                                    ProgressView()
                                                }
                                            }
                                            
                                            VStack {
                                                Image(recipe.Icon)
                                                    .resizable()
                                                    .frame(width: 20, height: 20)
                                                    .clipped()
                                            }
                                            .frame(width: 30, height: 30)
                                            .background(Color.white)
                                            .cornerRadius(100)
                                            .position(x: 25, y: 40)
                                        }
                                        
                                        VStack(alignment: .leading, spacing: 10) {
                                            VStack(alignment: .leading, spacing: 10) {
                                                // Category
                                                Text(recipe.Category)
                                                    .font(.system(size: 10))
                                                    .foregroundColor(.pink.opacity(0.6))
                                                    .fontWeight(.semibold)
                                                
                                                // Title
                                                Text(recipe.Title)
                                                    .font(.system(size: 15))
                                                    .foregroundColor(.blue)
                                                    .fontWeight(.bold)
                                            }
                                            .padding(2)
                                            .frame(height: 70)
                                            
                                            Spacer()
                                            
                                            HStack {
                                                HStack {
                                                    Image(systemName: "clock")
                                                        .accentColor(.gray)
                                                    Text("\(recipe.Time) mins")
                                                        .font(.system(size: 10))
                                                        .foregroundColor(.gray)
                                                }
                                                
                                                Spacer()
                                                
                                                Image(systemName: "heart.fill")
                                                    .foregroundColor(.pink)
                                            }
                                            .padding(10)
                                        }
                                        .padding(2)
                                        
                                        Spacer()
                                    }
                                    .frame(height: 280)
                                    .background(Color.white)
                                    .cornerRadius(10)
                                }
                                .padding(8)
                                .shadow(radius: 5)
                            }
                            .navigationTitle("Recipes")
                        }
                    }
                }
            }
            
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
                    addRecipe: recipes.addRecipe,
                    showAddRecipeView: $showAddRecipeView
                )
            }
        }
    }
}

#Preview {
    ListOfRecipes()
        .environmentObject(RecipeList())
}
