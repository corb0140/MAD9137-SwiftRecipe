//
//  RecipeDetailView.swift
//  SwiftRecipe
//
//  Created by Mark Corbin on 2024-10-19.
//

import SwiftUI

struct RecipeDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var recipes: RecipeList
    @State var recipeDetail: Recipe
    
    @State private var showEditView: Bool = false
    @State private var showActionSheet: Bool = false
    @State private var selected: Int = 0
    
    var delete: (Recipe) -> Void
    
    func updateRecipeDetail(_ recipeDetail: Recipe) {
        self.recipeDetail = recipeDetail
    }
    
    var body: some View {
        ZStack {
            // Image
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
                    Image("placeholder-image")
                        .resizable()
                        .frame(width: .infinity, height: 450)
                        .clipped()
                }
                
                Spacer()
            }
            
            // Background shader to over image
            VStack {}
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black.opacity(0.3))
            
            // Details
            VStack(alignment: .leading) {
                HStack(alignment: .top, spacing: 20) {
                    // Icon
                    Image(recipeDetail.Icon)
                        .resizable()
                        .frame(width: 30, height: 30)
                        .clipped()
                    
                    VStack(alignment: .leading, spacing: 10) {
                        // Category
                        Text(recipeDetail.Category)
                            .font(.system(size: 15))
                            .foregroundColor(.pink.opacity(0.6))
                            .fontWeight(.semibold)
                        
                        // Title
                        Text(recipeDetail.Title)
                            .font(.system(size: 20))
                            .foregroundColor(.blue)
                            .fontWeight(.bold)
                           
                        // Clock Icon
                        HStack {
                            Image(systemName: "clock")
                            Text("\(recipeDetail.Time) Minutes")
                        }
                    }
                  
                    Spacer()
                    
                    // Delete and edit button VStack
                    VStack {
                        // Delete Button
                        Button(action: {
                            showActionSheet = true
                        }) {
                            Image(systemName: "trash.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .symbolRenderingMode(.palette)
                                .foregroundStyle(.white, .red)
                                .clipped()
                        }
                        .actionSheet(isPresented: $showActionSheet) {
                            ActionSheet(
                                title: Text("Delete Recipe"),
                                message: Text(
                                    "Are you sure you want to delete this recipe?"
                                ),
                                buttons: [
                                    .destructive(Text("Delete")) {
                                        presentationMode.wrappedValue.dismiss()
                                        delete(recipeDetail)
                                    },
                                    .cancel(Text("Cancel"))
                                ]
                            )
                        }
                        
                        // Edit button
                        VStack {
                            Button(action: {
                                showEditView = true
                            }) {
                                Image(systemName: "pencil.circle.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .symbolRenderingMode(.palette)
                                    .foregroundStyle(.white, .pink.opacity(0.8))
                                    .clipped()
                            }
                            .sheet(isPresented: $showEditView) {
                                EditRecipe(
                                    recipeDetail: recipeDetail,
                                    showEditView: $showEditView,
                                    editRecipe: recipes.editRecipe,
                                    updateRecipeDetail: updateRecipeDetail
                                )
                            }
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 30)
                
                // Picker for ingredients and steps, between dividers
                Divider()
                    .frame(height: 2)
                    .background(Color.gray.opacity(0.4))
                    .padding(.horizontal, 10)
                
                Picker(selection: $selected) {
                    Text("Ingredients").tag(0)
                    Text("Steps").tag(1)
                } label: {
                    Text("Select an option")
                }
                .pickerStyle(.segmented)
                .padding(.horizontal, 10)
                
                Divider()
                    .frame(height: 2)
                    .background(Color.gray.opacity(0.4))
                    .padding(.horizontal, 10)
                
                // View for ingredients and steps picker
                if selected == 0 {
                    ScrollView {
                        HStack {
                            Spacer()
                            
                            VStack(alignment: .leading, spacing: 40) {
                                ForEach(
                                    recipeDetail.Ingredients,
                                    id: \.self
                                ) { ingredient in
                                    HStack(alignment: .center, spacing: 15) {
                                        Circle()
                                            .fill(Color.pink)
                                            .frame(width: 6, height: 6)
                                        Text(ingredient)
                                            .font(.system(size: 20))
                                            .opacity(0.7)
                                    }
                                }
                            }
                            .padding(.vertical, 40)
                            
                            Spacer()
                        }
                    }
                    
                } else {
                    ScrollView {
                        HStack {
                            Spacer()
                            
                            VStack(alignment: .leading, spacing: 40) {
                                ForEach(recipeDetail.Steps.indices, id: \.self) { index in
                                    let step = recipeDetail.Steps[index]
                                    
                                    HStack(alignment: .center, spacing: 15) {
                                        Text("\(index + 1).")
                                            .foregroundColor(.pink)
                                            .font(.system(size: 15))
                                        Text("\(step)")
                                            .opacity(0.7)
                                            .font(.system(size: 20))
                                    }
                                    .padding(.horizontal, 20)
                                }
                            }
                            .padding(.vertical, 40)
                            
                            Spacer()
                        }
                    }
                }
                
                Spacer()
            }
            .frame(maxWidth: 400, maxHeight: 550)
            .background(Color.white)
            .cornerRadius(50)
            .shadow(radius: 5)
            .padding(.bottom, -372)
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "arrowshape.backward.circle")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(Color.pink)
                        .frame(width: 40, height: 40)
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    RecipeDetailView(
        recipeDetail: Recipe(Icon: "icons8-leaves-48", Category: "Vegan", Title: "Strawberry Lemonade Smoothie",
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
