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
    @State private var selectedIcon: String = ""

    @State private var icon: String = ""
    @State private var category: String = ""
    @State private var time: Int = 0
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var ingredient: String = ""
    @State private var ingredients: [String] = []
    @State private var step: String = ""
    @State private var steps: [String] = []
    @State private var imageUrl: String = "https://www.thespruceeats.com/thmb/30mNE8tgd51KVSAQQmN7Vm1-_c0=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/mixed-berry-smoothie-2216234-hero-01-86d97765c90f47bba76d98a6d9152b62.jpg"
    @State private var showErrorMessage: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Section(header: Text("Add Recipe")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.pink)
            ) {
                VStack(spacing: 25) {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 15) {
                            VStack(alignment: .center) {
                                Text("Select Icon")
                                
                                HStack(spacing: 28) {
                                    Spacer()
                                    
                                    Button(action: {
                                        selectedIcon = "icons8-leaves-48"
                                        category = "Vegan"
                                    }) {
                                        Image("icons8-leaves-48")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .clipped()
                                    }
                                    
                                    Button(action: {
                                        selectedIcon = "icons8-protein-48"
                                        category = "Protein"
                                    }) {
                                        Image("icons8-protein-48")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .clipped()
                                    }
                                    
                                    Button(action: {
                                        selectedIcon = "icons8-leaf-48"
                                        category = "Green"
                                    }) {
                                        Image("icons8-leaf-48")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .clipped()
                                    }
                                    
                                    Button(action: {
                                        selectedIcon = "icons8-energy-48"
                                        category = "Energy"
                                    }) {
                                        Image("icons8-energy-48")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .clipped()
                                    }
                                    
                                    Spacer()
                                }
                            }
                            
                            // Icon
                            VStack(alignment: .leading, spacing: 5) {
                                TextField("Select Icon Above", text: $selectedIcon)
                                    .disabled(true)
                                    .padding(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 2)
                                            .stroke(Color.gray, lineWidth: 1)
                                    )
                            }
                            
                            // Category
                            VStack(alignment: .leading, spacing: 5) {
                                TextField("Category Selected With Icon", text: $category)
                                    .disabled(true)
                                    .padding(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 2)
                                            .stroke(Color.gray, lineWidth: 1)
                                    )
                            }
                            
                            // Time
                            VStack(alignment: .leading, spacing: 5) {
                                TextField(
                                    "Enter Time",
                                    value: $time,
                                    formatter: NumberFormatter()
                                )
                                .padding(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 2)
                                        .stroke(Color.gray, lineWidth: 1)
                                )
                            }
                            
                            // Title
                            VStack(alignment: .leading, spacing: 5) {
                                TextField("Enter Title", text: $title)
                                    .padding(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 2)
                                            .stroke(Color.gray, lineWidth: 1)
                                    )
                            }
                            
                            // Description
                            VStack(alignment: .leading, spacing: 5) {
                                TextField("Enter Description", text: $description)
                                    .padding(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 2)
                                            .stroke(Color.gray, lineWidth: 1)
                                    )
                            }
                        }
                        
                        // Ingredients
                        VStack(alignment: .leading) {
                            TextField("Enter Ingredient", text: $ingredient)
                                .padding(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 2)
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
                            .padding(2)
                            .frame(width: 150)
                            .background(Color.pink.opacity(0.7))
                            .cornerRadius(5)
                        }
                        
                        // Steps
                        VStack(alignment: .leading) {
                            TextField("Enter Step", text: $step)
                                .padding(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 2)
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
                            .padding(2)
                            .frame(width: 150)
                            .background(Color.pink.opacity(0.7))
                            .cornerRadius(5)
                        }
                        
                        // Image
                        VStack(alignment: .leading) {
                            TextField("Enter Image Url", text: $imageUrl)
                                .padding(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 2)
                                        .stroke(Color.gray, lineWidth: 1)
                                )
                            
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
                                    if title.isEmpty || description.isEmpty || steps.isEmpty || ingredients.isEmpty || selectedIcon.isEmpty || category.isEmpty || time == 0 {
                                        showErrorMessage = true
                                    } else {
                                        let newRecipe = Recipe(
                                            Icon: selectedIcon,
                                            Category: category,
                                            Title: title,
                                            Description: description,
                                            Ingredients: ingredients,
                                            Steps: steps,
                                            Time: time,
                                            Image: imageUrl
                                        )
                                        
                                        addRecipe(newRecipe)
                                        showAddRecipeView = false
                                        
                                        icon = ""
                                        category = ""
                                        time = 0
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
                                .padding(4)
                                .frame(width: 150)
                                .background(Color.pink)
                                .cornerRadius(5)
                                .alert(
                                    "All fields except imageUrl must be filled",
                                    isPresented: $showErrorMessage
                                ) {
                                    Button("OK", role: .cancel) {}
                                }
                            
                            Button(action: {
                                showAddRecipeView = false
                            }) {
                                Text("Cancel")
                                    .font(.subheadline)
                                    .padding(9)
                                    .foregroundColor(.white)
                                    .frame(width: 120)
                            }
                            .padding(4)
                            .frame(width: 150)
                            .background(Color.red)
                            .cornerRadius(5)
                        }
                        .padding(10)
                        
                        Spacer()
                    }
                }
            }
        }
        .padding()
        .frame(maxHeight: .infinity)
      
        Spacer()
    }
}

#Preview {
    AddRecipe(
        addRecipe: { _ in
            print("Testing")
        }, showAddRecipeView: .constant(false)
    )
}
