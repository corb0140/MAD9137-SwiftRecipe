//
//  AddRecipe.swift
//  SwiftRecipe
//
//  Created by Mark Corbin on 2024-10-19.
//

import SwiftUI

struct AddRecipe: View {
    var addRecipe: (Recipe) -> Void
    @Binding var showAddRecipeView: Bool

    @State private var title: String = ""
    @State private var description: String = ""
    @State private var ingredient: String = ""
    @State private var ingredients: [String] = []
    @State private var step: String = ""
    @State private var steps: [String] = []
    @State private var imageUrl: String = ""
    @State private var showErrorMessage: Bool = false
    
    var body: some View {
        Form {
            Section(header: Text("Add Recipe")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.teal)
            ) {
                VStack(spacing: 25) {
                    VStack(alignment: .leading, spacing: 15) {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Title:")
                                .font(.title3)
                                .foregroundColor(.gray)
                            TextField("Title", text: $title)
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Description:")
                                .font(.title3)
                                .foregroundColor(.gray)
                            TextField("Description", text: $description)
                        }
                    }
                    
                    // Ingredients
                    VStack(alignment: .leading) {
                        TextField("Ingredient", text: $ingredient)
                            .padding(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                        
                        // See Ingredients Currently In Array
                        ForEach(ingredients.indices, id: \.self) { index in
                            HStack {
                                Text(ingredients[index])
                                
                                Spacer()
                                
                                // Remove Ingredient
                                Button(action: {
                                    ingredients.remove(at: index)
                                }) {
                                    Text("Remove").foregroundColor(.red)
                                }
                            }
                        }
                      
                        // Add Ingredient Button
                        Button(action: {
                            if !ingredient.isEmpty {
                                ingredients.append(ingredient)
                                ingredient = ""
                            }
                        }) {
                            Text("Add Ingredient")
                                .foregroundColor(.white)
                                .padding(9)
                        }
                        .background(Color.blue)
                        .cornerRadius(5)
                        .buttonStyle(BorderedButtonStyle())
                    }
                    
                    // Steps
                    VStack(alignment: .leading) {
                        TextField("Step", text: $step)
                            .padding(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                        
                        // See Steps Currently In Array
                        ForEach(steps.indices, id: \.self) { index in
                            HStack {
                                Text(steps[index])
                                
                                Spacer()
                                
                                // Remove Item
                                Button(action: {
                                    steps.remove(at: index)
                                }) {
                                    Text("Remove").foregroundColor(.red)
                                }
                            }
                        }
                     
                        // Add Step Button
                        Button(action: {
                            if !step.isEmpty {
                                steps.append(step)
                                step = ""
                            }
                        }) {
                            Text("Add Step")
                                .foregroundColor(.white)
                                .padding(9)
                        }
                        .background(Color.blue)
                        .cornerRadius(5)
                        .buttonStyle(BorderedButtonStyle())
                    }
                  
                    // Image
                    VStack(alignment: .leading) {
                        Text("Image Url:")
                            .font(.title3)
                            .foregroundColor(.gray)
                        TextField("Image Url", text: $imageUrl)
                        
                        AsyncImage(url: URL(string: imageUrl)) {
                            image in
                            image.resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: .infinity, height: 200)
                                .clipped()
                                .shadow(color: .gray, radius: 5, x: 0, y: 5)
                        } placeholder: {
                            Text("")
                        }
                    }
                    
                    HStack {
                        // Add Recipe button
                        Button(
                            action: {
                                if title.isEmpty || description.isEmpty || steps.isEmpty || ingredients.isEmpty {
                                    showErrorMessage = true
                                } else {
                                    let newRecipe = Recipe(
                                        Title: title,
                                        Description: description,
                                        Ingredients: ingredients,
                                        Steps: steps,
                                        Image: imageUrl
                                    )
                                    
                                    addRecipe(newRecipe)
                                    showAddRecipeView = false
                                    
                                    title = ""
                                    description = ""
                                    ingredients = []
                                    steps = []
                                    imageUrl = ""
                                }
                                
                            }) {
                                Text("Add Recipe")
                                    .font(.subheadline)
                                    .padding(9)
                                    .foregroundColor(.white)
                                    .frame(width: 120)
                            }
                            .background(Color.blue)
                            .cornerRadius(5)
                            .buttonStyle(BorderedButtonStyle())
                          
                        Button(action: {
                            showAddRecipeView = false
                        }) {
                            Text("Cancel")
                                .font(.subheadline)
                                .padding(9)
                                .foregroundColor(.white)
                                .frame(width: 120)
                        }
                        .background(Color.red)
                        .cornerRadius(5)
                        .buttonStyle(BorderedButtonStyle())
                    }
                    
                    if showErrorMessage {
                        Text("All fields except imageUrl are required to add a recipe.")
                            .foregroundColor(.red)
                            .font(.system(size: 17))
                            .padding(.top)
                            .multilineTextAlignment(.center)
                    }
                }
            }
        }
    }
}

#Preview {
    AddRecipe(addRecipe: { _ in
        print("Testing")
    }, showAddRecipeView: .constant(false))
}
