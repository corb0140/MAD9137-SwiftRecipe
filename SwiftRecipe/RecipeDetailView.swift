//
//  RecipeDetailView.swift
//  SwiftRecipe
//
//  Created by Mark Corbin on 2024-10-19.
//

import SwiftUI

struct RecipeDetailView: View {
    @EnvironmentObject var recipes: RecipeList
    @State var recipeDetail: Recipe
    
    @State private var showEditView: Bool = false
    @State private var showActionSheet: Bool = false
    @State private var placeHolderImage: String = "https://archive.org/download/placeholder-image/placeholder-image.jpg"
    
    var delete: (Recipe) -> Void
    
    func updateRecipeDetail(_ recipeDetail: Recipe) {
        self.recipeDetail = recipeDetail
    }
    
    var body: some View {
        ZStack {
            VStack {
                if !recipeDetail.Image.isEmpty {
                    AsyncImage(url: URL(string: recipeDetail.Image)) {
                        image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: .infinity, height: 450, alignment: .topLeading)
                            .clipped()
                        
                    } placeholder: {
                        ProgressView()
                    }
                } else {
                    AsyncImage(
                        url: URL(string: placeHolderImage)
                    ) {
                        image in
                        image.resizable()
                            .frame(width: .infinity, height: 100)
                            .clipped()
                    } placeholder: {
                        ProgressView()
                    }
                }
                
                Spacer()
            }
            
            VStack {}
                .frame(maxWidth: 400, maxHeight: 500)
                .background(Color.white)
                .cornerRadius(50)
                .shadow(radius: 5)
                .padding(.bottom, -372)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    RecipeDetailView(
        recipeDetail: Recipe(Icon: "icon-vegan-48", Category: "Vegan", Title: "Strawberry Lemonade Smoothie",
                             Description: "A sweet and tangy beverage to take on the go",
                             Ingredients: ["Lemonade", "Lemon Yogurt", "Frozen Strawberries"],
                             Steps: ["Place all ingredients in a blender", "cover and process 15 seconds or until blended", "Serve immediately"],
                             Time: 6,
                             Image: "https://www.thespruceeats.com/thmb/sFNQ8AqRurVo28e4Xosj9bTdMyY=/425x300/filters:max_bytes(150000):strip_icc():format(webp)/strawberry-breakfast-smoothie-recipe-2097149-hero-02-5c1d4b2a46e0fb00014bf2ec.jpg"),
        delete: { _ in
            print("Testing")
        }
    )
    .environmentObject(RecipeList())
}
