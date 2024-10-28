//
//  RecipeDetailView.swift
//  SwiftRecipe
//
//  Created by Mark Corbin on 2024-10-19.
//

import SwiftUI

struct RecipeDetailView: View {
    @State var recipeDetail: Recipe
    
    @State private var showEditView: Bool = false
    @State private var showActionSheet: Bool = false
    @State private var placeHolderImage: String = "https://archive.org/download/placeholder-image/placeholder-image.jpg"
    
    var delete: (Recipe) -> Void

    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                // Image
                if !recipeDetail.Image.isEmpty {
                    AsyncImage(url: URL(string: recipeDetail.Image)) {
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
                    AsyncImage(url: URL(string: placeHolderImage)) {
                        image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: .infinity, height: 200)
                            .clipped()
                            .shadow(color: .gray, radius: 5, x: 0, y: 5)
                    } placeholder: {
                        ProgressView()
                    }
                }
            }
                
            // Scrollview
            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    Text(recipeDetail.Title)
                        .font(.title)
                        .fontWeight(.bold)
                        .textCase(.uppercase)
                        .foregroundColor(.teal)
                        
                    // Description
                    VStack(alignment: .leading) {
                        Text("Description:")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                            .textCase(.uppercase)
                            
                        Text(recipeDetail.Description)
                            .font(.system(size: 20))
                            .offset(y: 5)
                    }
                    
                    // Ingredients
                    VStack(alignment: .leading) {
                        Text("Ingredients:")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                            .textCase(.uppercase)
                            
                        VStack(alignment: .leading, spacing: 5) {
                            ForEach(
                                recipeDetail.Ingredients.indices,
                                id: \.self
                            ) { index in
                                let ingredient = recipeDetail.Ingredients[index]
                                let isLast = index == recipeDetail.Ingredients.count - 1
                                
                                Text("\(ingredient)\(isLast ? "." : ",")")
                                    .font(.system(size: 20))
                            }
                        }
                        .offset(y: 5)
                    }
                    .padding(.top)
                    
                    // Steps
                    VStack(alignment: .leading) {
                        Text("Steps:")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                            .textCase(.uppercase)
                            
                        VStack(alignment: .leading, spacing: 10) {
                            ForEach(recipeDetail.Steps.indices, id: \.self) { index in
                                let step = recipeDetail.Steps[index]
                                    
                                HStack(alignment: .top) {
                                    Text("\(index + 1).")
                                    Text("\(step)")
                                }
                                .font(.system(size: 20))
                            }
                        }
                        .offset(y: 5)
                    } // VStack end for steps
                    .padding(.top)
                } // VStack end for Info
                .padding()
                
                HStack {
                    // Edit Recipe button
                    Button("Edit Recipe") {
                        showEditView = true
                    }
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(width: 140)
                    .padding(9)
                    .background(Color.green)
                    .cornerRadius(5)
                    .sheet(isPresented: $showEditView) {
                        EditRecipe(
                            recipeDetail: recipeDetail,
                            showEditView: $showEditView
                        )
                    }
                    
                    // Delete Recipe Button
                    Button("Delete Recipe") {
                        showActionSheet = true
                    }
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(width: 140)
                    .padding(9)
                    .background(Color.red)
                    .cornerRadius(5)
                    .actionSheet(isPresented: $showActionSheet) {
                        ActionSheet(
                            title: Text("Delete Recipe"),
                            message: Text(
                                "Are you sure you want to delete this recipe?"
                            ),
                            buttons: [
                                .destructive(Text("Delete")) {
                                    delete(recipeDetail)
                                },
                                .cancel(Text("Cancel"))
                            ]
                        )
                    }
                } // Button HStack
                .padding()
            } // Scrollview End
        } // First VStack end
        
        Spacer()
    }
}

#Preview {
    RecipeDetailView(
        recipeDetail: Recipe(Title: "Strawberry Lemonade Smoothie",
                             Description: "A sweet and tangy beverage to take on the go",
                             Ingredients: ["Lemonade", "Lemon Yogurt", "Frozen Strawberries"],
                             Steps: ["Place all ingredients in a blender", "cover and process 15 seconds or until blended", "Serve immediately"],
                             Image: "https://www.thespruceeats.com/thmb/sFNQ8AqRurVo28e4Xosj9bTdMyY=/425x300/filters:max_bytes(150000):strip_icc():format(webp)/strawberry-breakfast-smoothie-recipe-2097149-hero-02-5c1d4b2a46e0fb00014bf2ec.jpg"),
        delete: {_ in 
            print("Testing")
        }
    )
}
