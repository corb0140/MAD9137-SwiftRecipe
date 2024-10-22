//
//  RecipeDetailView.swift
//  SwiftRecipe
//
//  Created by Mark Corbin on 2024-10-19.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipeDetail: Recipe
    
    var delete: () -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
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
            }
                
            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    Text(recipeDetail.Title)
                        .font(.title)
                        .fontWeight(.bold)
                        .textCase(.uppercase)
                        .foregroundColor(.teal)
                        
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
                            }
                            .font(.system(size: 20))
                        }
                        .offset(y: 5)
                    }
                    .padding(.top)
                        
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
                
                Button(action: {
                    delete()
                }) {
                    Text("Delete Recipe")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                }
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
        delete: {
            print("Testing")
        }
    )
}
