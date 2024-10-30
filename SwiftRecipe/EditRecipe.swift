//
//  EditRecipe.swift
//  SwiftRecipe
//
//  Created by Mark Corbin on 2024-10-24.
//

import SwiftUI

struct EditRecipe: View {
    @State var recipeDetail: Recipe
    @Binding var showEditView: Bool
    
    @State private var category: String = ""
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var ingredient = ""
    @State private var ingredients: [String] = []
    @State private var step = ""
    @State private var steps: [String] = []
    @State private var time: Int = 0
    @State private var imageUrl: String = ""
   
    var editRecipe: (Recipe) -> Void
    var updateRecipeDetail: (Recipe) -> Void
  
    var body: some View {
        VStack {
            ScrollView {
                Section(header: Text("Edit Recipe")
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
                                    .padding(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(Color.gray, lineWidth: 1)
                                    )
                            }
                                
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Description:")
                                    .font(.title3)
                                    .foregroundColor(.gray)
                                TextField("Description", text: $description)
                                    .padding(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(Color.gray, lineWidth: 1)
                                    )
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
                                
                            // Add Ingredient
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
                            
                        // Step
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
                                        
                                    // Remove Step
                                    Button(action: {
                                        steps.remove(at: index)
                                    }) {
                                        Text("Remove").foregroundColor(.red)
                                    }
                                }
                            }
                                
                            // Add Step
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
                        VStack(alignment: .leading, spacing: 30) {
                            TextField("Image Url", text: $imageUrl)
                                
                            if !imageUrl.isEmpty {
                                AsyncImage(url: URL(string: imageUrl)) {
                                    image in
                                    image.resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: .infinity, height: 200)
                                        .clipped()
                                        .shadow(color: .gray, radius: 5, x: 0, y: 5)
                                } placeholder: {
                                    ProgressView()
                                }
                            } else {
                                Text("No Image Provided")
                            }
                        }
                    }
                }
                    
                HStack {
                    Button(
                        action: {
                            let updatedRecipe = Recipe(
                                id: recipeDetail.id,
                                Category: category,
                                Title: title,
                                Description: description,
                                Ingredients: ingredients,
                                Steps: steps,
                                Time: time,
                                Image: imageUrl
                            )
                                
                            updateRecipeDetail(updatedRecipe)
                            editRecipe(updatedRecipe)
                            showEditView = false
                                
                        }) {
                            Text("Update Recipe")
                                .font(.subheadline)
                                .frame(width: 110)
                                .padding(18)
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .cornerRadius(5)
                        }
                        .padding(.top, 8)
                        .frame(width: .infinity)
                        
                    Button(
                        action: {
                            showEditView = false
                        }) {
                            Text("Cancel")
                                .font(.subheadline)
                                .frame(width: 110)
                                .padding(18)
                                .background(Color.red)
                                .foregroundColor(.white)
                                .cornerRadius(5)
                        }
                        .padding(.top, 8)
                }
            }
        }
        .onAppear {
            title = recipeDetail.Title
            description = recipeDetail.Description
            ingredients = recipeDetail.Ingredients
            steps = recipeDetail.Steps
            imageUrl = recipeDetail.Image
        }
        .padding()
        .frame(maxHeight: .infinity)
        
        Spacer()
    }
}

#Preview {
    EditRecipe(
        recipeDetail: Recipe(Category: "Vegan", Title: "Strawberry Lemonade Smoothie",
                             Description: "A sweet and tangy beverage to take on the go",
                             Ingredients: ["Lemonade", "Lemon Yogurt", "Frozen Strawberries"],
                             Steps: ["Place all ingredients in a blender", "cover and process 15 seconds or until blended", "Serve immediately"],
                             Time: 6,
                             Image: "https://www.thespruceeats.com/thmb/sFNQ8AqRurVo28e4Xosj9bTdMyY=/425x300/filters:max_bytes(150000):strip_icc():format(webp)/strawberry-breakfast-smoothie-recipe-2097149-hero-02-5c1d4b2a46e0fb00014bf2ec.jpg"),
        showEditView:
        .constant(false),
        editRecipe: {
            _ in print("Testing")
        },
        updateRecipeDetail: { _ in print("Testing") }
    )
}
