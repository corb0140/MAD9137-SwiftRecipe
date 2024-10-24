//
//  EditRecipe.swift
//  SwiftRecipe
//
//  Created by Mark Corbin on 2024-10-24.
//

import SwiftUI

struct EditRecipe: View {
    var recipeDetail: Recipe
    var editRecipe: (Recipe) -> Void

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    EditRecipe(recipeDetail: Recipe(Title: "Strawberry Lemonade Smoothie",
                                    Description: "A sweet and tangy beverage to take on the go",
                                    Ingredients: ["Lemonade", "Lemon Yogurt", "Frozen Strawberries"],
                                    Steps: ["Place all ingredients in a blender", "cover and process 15 seconds or until blended", "Serve immediately"],
                                    Image: "https://www.thespruceeats.com/thmb/sFNQ8AqRurVo28e4Xosj9bTdMyY=/425x300/filters:max_bytes(150000):strip_icc():format(webp)/strawberry-breakfast-smoothie-recipe-2097149-hero-02-5c1d4b2a46e0fb00014bf2ec.jpg"))
    { _ in
        print("Testing")
    }
}
