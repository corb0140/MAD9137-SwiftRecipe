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
    @State private var showErrorMessage: Bool = false

    @State private var selectedIcon: String = ""
    @State private var category: String = ""
    @State private var time: Int = 0
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var ingredient: String = ""
    @State private var ingredients: [String] = []
    @State private var step: String = ""
    @State private var steps: [String] = []
    @State private var imageUrl: String = ""
   
    var editRecipe: (Recipe) -> Void
    var updateRecipeDetail: (Recipe) -> Void
  
    var body: some View {
        VStack {
            ScrollView {
                Section(header: Text("Edit Recipe")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.pink)
                    .padding(5)
                ) {
                    VStack(spacing: 25) {
                        VStack(alignment: .leading, spacing: 15) {
                            VStack(alignment: .leading, spacing: 5) {
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
                                    HStack(alignment: .center) {
                                        Circle()
                                            .frame(width: 5, height: 5)
                                            .foregroundColor(Color.pink)
                                        Text(ingredients[index])
                                    }
                                
                                    Spacer()
                                    
                                    // Remove Ingredient
                                    Button(action: {
                                        ingredients.remove(at: index)
                                    }) {
                                        Image(systemName: "minus.circle")
                                            .foregroundColor(.red)
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
                                HStack(alignment: .top) {
                                    VStack {
                                        HStack {
                                            Text("\(index + 1).")
                                                .font(.system(size: 15))
                                            Text("\(steps[index]).")
                                        }
                                    }
                                    Spacer()
                                    
                                    // Remove Item
                                    Button(action: {
                                        steps.remove(at: index)
                                    }) {
                                        Image(systemName: "minus.circle")
                                            .foregroundColor(.red)
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
                        VStack(alignment: .leading, spacing: 30) {
                            TextField("Enter Image Url", text: $imageUrl)
                                .padding(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 2)
                                        .stroke(Color.gray, lineWidth: 1)
                                )
                                
                            if !imageUrl.isEmpty {
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
                            } else {
                                Text("No Image Provided")
                            }
                        }
                    }
                }
                    
                HStack {
                    Button(
                        action: {
                            if title.isEmpty || description.isEmpty || steps.isEmpty || ingredients.isEmpty || selectedIcon.isEmpty || category.isEmpty || time == 0 {
                                showErrorMessage = true
                            } else {
                                let updatedRecipe = Recipe(
                                    id: recipeDetail.id,
                                    Icon: selectedIcon,
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
                            }
                            
                        }) {
                            Text("Update Recipe")
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
                        
                    Button(
                        action: {
                            showEditView = false
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
            }
        }
        .onAppear {
            selectedIcon = recipeDetail.Icon
            category = recipeDetail.Category
            time = recipeDetail.Time
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
        recipeDetail: Recipe(Icon: "icons8-vegan-48", Category: "Vegan", Title: "Strawberry Lemonade Smoothie",
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
