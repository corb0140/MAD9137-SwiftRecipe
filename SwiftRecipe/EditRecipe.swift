//
//  EditRecipe.swift
//  SwiftRecipe
//
//  Created by Mark Corbin on 2024-10-24.
//

import SwiftUI

struct EditRecipe: View {
    @State var recipeDetail: Recipe
    var editRecipe: (Recipe) -> Void
    @Binding var showEditView: Bool
    
    @State private var title: String
    @State private var description: String
    @State private var ingredients: [String]
    @State private var steps: [String]
    @State private var imageUrl: String
    @State private var ingredient = ""
    @State private var step = ""
  
    init(recipeDetail: Recipe, editRecipe: @escaping (Recipe) -> Void, showEditView: Binding<Bool>) {
        self.recipeDetail = recipeDetail
        self.editRecipe = editRecipe
        self._showEditView = showEditView
        _title = State(initialValue: recipeDetail.Title)
        _description = State(initialValue: recipeDetail.Description)
        _ingredients = State(initialValue: recipeDetail.Ingredients)
        _steps = State(initialValue: recipeDetail.Steps)
        _imageUrl = State(initialValue: recipeDetail.Image)
    }
    
    var body: some View {
        Form {
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
                                Title: title,
                                Description: description,
                                Ingredients: ingredients,
                                Steps: steps,
                                Image: imageUrl
                            )
                            
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
    }
}

#Preview {
    EditRecipe(recipeDetail: Recipe(Title: "Strawberry Lemonade Smoothie",
                                    Description: "A sweet and tangy beverage to take on the go",
                                    Ingredients: ["Lemonade", "Lemon Yogurt", "Frozen Strawberries"],
                                    Steps: ["Place all ingredients in a blender", "cover and process 15 seconds or until blended", "Serve immediately"],
                                    Image: "https://www.thespruceeats.com/thmb/sFNQ8AqRurVo28e4Xosj9bTdMyY=/425x300/filters:max_bytes(150000):strip_icc():format(webp)/strawberry-breakfast-smoothie-recipe-2097149-hero-02-5c1d4b2a46e0fb00014bf2ec.jpg"),
               editRecipe: { _ in
                   print("testing edit recipe")
               },
               showEditView: .constant(false))
}
