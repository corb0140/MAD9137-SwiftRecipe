//
//  ListOfRecipes.swift
//  SwiftRecipe
//
//  Created by Mark Corbin on 2024-10-19.
//

import SwiftUI

struct ListOfRecipes: View {
    @EnvironmentObject var recipes: RecipeList
    @State private var filterByCategory: String = "All"
    @State private var showAddRecipeView: Bool = false
    @State private var placeHolderImage: String = "https://archive.org/download/placeholder-image/placeholder-image.jpg"
    @State private var likedRecipes: Set<String> = []
    @State private var showDetailView: Bool = false
    
    var filteredRecipes: [Recipe] {
        if filterByCategory == "All" {
            return recipes.recipesArray
        } else {
            return recipes.recipesArray
                .filter { $0.Category == filterByCategory }
        }
    }
    
    private let flexibleColumn = [
        GridItem(.flexible(minimum: 100, maximum: 200)),
        GridItem(.flexible(minimum: 100, maximum: 200))
    ]
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            // Navigation Stack
            NavigationStack {
                VStack {
                    // Buttons HStack
                    HStack(spacing: 20) {
                        Spacer()
                        
                        // Button for all
                        Button(action: {
                            filterByCategory = "All"
                        }) {
                            VStack {
                                VStack {
                                    Image("icons8-smoothie-64")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .clipped()
                                }
                                .frame(width: 35, height: 35)
                                .background(filterByCategory == "All" ? Color.pink : Color.white)
                                .cornerRadius(100)
                                .shadow(radius: 5)
                                
                                Text("All")
                            }
                        }
                        
                        // Button for vegan
                        Button(action: {
                            filterByCategory = "Vegan"
                        }) {
                            VStack {
                                VStack {
                                    Image("icons8-leaves-48")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .clipped()
                                }
                                .frame(width: 35, height: 35)
                                .background(filterByCategory == "Vegan" ? Color.pink : Color.white)
                                .cornerRadius(100)
                                .shadow(radius: 5)
                                
                                Text("Vegan")
                            }
                        }
                        
                        // Button for protein
                        Button(action: {
                            filterByCategory = "Protein"
                        }) {
                            VStack {
                                VStack {
                                    Image("icons8-protein-48")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .clipped()
                                }
                                .frame(width: 35, height: 35)
                                .background(filterByCategory == "Protein" ? Color.pink : Color.white)
                                .cornerRadius(100)
                                .shadow(radius: 5)
                                
                                Text("Protein")
                            }
                        }
                        
                        // Button for green
                        Button(action: {
                            filterByCategory = "Green"
                        }) {
                            VStack {
                                VStack {
                                    Image("icons8-leaf-48")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .clipped()
                                }
                                .frame(width: 35, height: 35)
                                .background(filterByCategory == "Green" ? Color.pink : Color.white)
                                .cornerRadius(100)
                                .shadow(radius: 5)
                                
                                Text("Green")
                            }
                        }
                        
                        // Button for energy
                        Button(action: {
                            filterByCategory = "Energy"
                        }) {
                            VStack {
                                VStack {
                                    Image("icons8-energy-48")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .clipped()
                                }
                                .frame(width: 35, height: 35)
                                .background(filterByCategory == "Energy" ? Color.pink : Color.white)
                                .cornerRadius(100)
                                .shadow(radius: 5)
                                
                                Text("Energy")
                            }
                        }
                        
                        Spacer()
                    }
                    .padding(.horizontal, 5)
                    .padding(.vertical, 20)
                    
                    // Scroll View
                    ScrollView {
                        // Grid List
                        LazyVGrid(columns: flexibleColumn, spacing: 10) {
                            // Loop through list with filter
                            ForEach(filteredRecipes, id: \.self) {
                                recipe in NavigationLink(
                                    destination: RecipeDetailView(
                                        recipeDetail: recipe,
                                        delete: { _ in
                                            recipes.deleteRecipe(recipe)
                                        }
                                    )
                                    // Show add button when on this view
                                    .onAppear {
                                        showDetailView = true
                                    }
                                    // Hide add button when leaving this view
                                    .onDisappear {
                                        showDetailView = false
                                    }
                                ) {
                                    // Recipe Card
                                    VStack {
                                        // Recipe card image and icon ZStack
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
                                                AsyncImage(url: URL(string: placeHolderImage)) {
                                                    image in
                                                    image.resizable()
                                                        .frame(width: .infinity, height: 150, alignment: .topLeading)
                                                        .clipped()
                                                } placeholder: {
                                                    ProgressView()
                                                }
                                            }
                                            
                                            // Recipe Icon
                                            VStack {
                                                Image(recipe.Icon)
                                                    .resizable()
                                                    .frame(width: 20, height: 20)
                                                    .clipped()
                                            }
                                            .frame(width: 30, height: 30)
                                            .background(Color.white)
                                            .cornerRadius(100)
                                            .position(x: 25, y: 30)
                                        }
                                        
                                        // Recipe card info VStack
                                        VStack(alignment: .leading, spacing: 10) {
                                            VStack(alignment: .leading, spacing: 10) {
                                                // Category
                                                Text(recipe.Category)
                                                    .font(.system(size: 10))
                                                    .foregroundColor(.pink.opacity(0.6))
                                                    .fontWeight(.semibold)
                                                
                                                // Title
                                                VStack(alignment: .leading) {
                                                    Text(recipe.Title)
                                                        .font(.system(size: 15))
                                                        .foregroundColor(.blue)
                                                        .fontWeight(.bold)
                                                        .multilineTextAlignment(.leading)
                                                }
                                                .frame(height: 50)
                                            }
                                            .padding(.horizontal, 6)
                                            
                                            // Time and like button HStack
                                            HStack {
                                                // Time
                                                HStack {
                                                    Image(systemName: "clock")
                                                        .accentColor(.gray)
                                                    Text("\(recipe.Time) mins")
                                                        .font(.system(size: 10))
                                                        .foregroundColor(.gray)
                                                }
                                                
                                                Spacer()
                                                
                                                // Like recipe button. change icon on click
                                                Button(action: {
                                                    if likedRecipes.contains(recipe.Title) {
                                                        likedRecipes.remove(recipe.Title)
                                                    } else {
                                                        likedRecipes.insert(recipe.Title)
                                                    }
                                                }) {
                                                    Image(systemName: likedRecipes.contains(recipe.Title) ? "heart.fill" : "heart")
                                                        .foregroundColor(.pink)
                                                }
                                            }
                                            .padding(10)
                                            
                                            Spacer()
                                        }
                                        .padding(2)
                                    }
                                    .frame(minHeight: 280)
                                    .background(Color.white)
                                    .cornerRadius(10)
                                }
                                .padding(8)
                                .shadow(radius: 5)
                            }
                            .navigationTitle("Recipes")
                            .navigationBarTitleDisplayMode(.inline)
                        }
                    }
                }
            }
            
            // Add Recipe Button & Sheet
            if !showDetailView {
                Button {
                    showAddRecipeView = true
                } label: {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .accentColor(.blue)
                }
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
}

#Preview {
    ListOfRecipes()
        .environmentObject(RecipeList())
}
