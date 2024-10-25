//
//  AddRecipe.swift
//  SwiftRecipe
//
//  Created by Mark Corbin on 2024-10-19.
//

import SwiftUI

struct AddRecipe: View {
    var addRecipe: (Recipe) -> Void

    @State private var title: String = ""
    @State private var description: String = ""
    @State private var ingredient: String = ""
    @State private var ingredients: [String] = []
    @State private var step: String = ""
    @State private var steps: [String] = []
    @State private var imageUrl: String = "https://billetterie.psg.fr/media/allianz-1.jpg"
    @State private var isSelected: Bool = false

    var body: some View {
        Form {
            Section(header: Text("Add Recipe")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.teal)
            ) {
                VStack(spacing: 25) {
                    TextField("Title", text: $title)
                    TextField("Description", text: $description)
                    
                    // Add Ingredient
                    VStack(alignment: .leading) {
                        TextField("Ingredient", text: $ingredient)
                        ForEach(ingredients.indices, id: \.self) { index in
                            HStack {
                                Text(ingredients[index])
                                
                                Spacer()
                                
                                Button(action: {
                                    ingredients.remove(at: index)
                                }) {
                                    Text("Remove").foregroundColor(.red)
                                }
                            }
                        }
                      
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
                    
                    // Add Step
                    VStack(alignment: .leading) {
                        TextField("Step", text: $step)
                        ForEach(steps.indices, id: \.self) { index in
                            HStack {
                                Text(steps[index])
                                
                                Spacer()
                                
                                Button(action: {
                                    steps.remove(at: index)
                                }) {
                                    Text("Remove").foregroundColor(.red)
                                }
                            }
                        }
                     
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
                        
                        if isSelected == true {
                            if let url = URL(string: imageUrl), !imageUrl.isEmpty {
                                AsyncImage(url: url) {
                                    selectedUrl in
                                    if let image = selectedUrl.image {
                                        image
                                            .resizable()
                                            .frame(width: .infinity, height: 200)
                                            .clipped()
                                    } else {
                                        Text("Loading Image ...")
                                    }
                                }
                            }
                        }
                    }
                }
            } // Form end
            
            // View Image Button
            Button(action: {
                isSelected.toggle()
            }) {
                Text("View Image")
                    .font(.subheadline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(5)
            }
           
            Button(
                action: {
                    let newRecipe = Recipe(
                        Title: title,
                        Description: description,
                        Ingredients: ingredients,
                        Steps: steps,
                        Image: imageUrl
                    )
                    
                    addRecipe(newRecipe)
                    
                    title = ""
                    description = ""
                    ingredients = []
                    steps = []
                    imageUrl = ""
                }) {
                    Text("Add Recipe")
                        .font(.subheadline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                }
        }
    }
}

#Preview {
    AddRecipe { _ in print("Testing") }
}
