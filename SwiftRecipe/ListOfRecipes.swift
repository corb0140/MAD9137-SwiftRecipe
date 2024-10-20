//
//  ListOfRecipes.swift
//  SwiftRecipe
//
//  Created by Mark Corbin on 2024-10-19.
//

import SwiftUI

struct Recipe: Identifiable {
    let id = UUID()
    let Title: String
    let Description: String
    let Ingredients: [String]
    let Steps: [String]
    let Image: String
}

struct ListOfRecipes: View {
    @State private var recipes = [
        Recipe(
            Title: "Ham and Swiss Omelet",
            Description: "This omelet will put pep in your step all morning long.",
            Ingredients: ["Eggs", "Ham", "Swiss Cheese"],
            Steps: ["Make the eggs", "fill egg with ham and cheese", "Fold egg over the filling"],
            Image: "Ham-and-Swiss"
        ),
        Recipe(
            Title: "Italian Cloud Eggs",
            Description: "These cloud-like eggs offer you the breakfast of your dreams.",
            Ingredients: ["Eggs", "Italian Seasoning", "Basil", "Salt", "Pepper"],
            Steps: ["Preheat oven to 450º", "Beat eggs, italian seasoing, salt and pepper in bowl", "put in a iron skillet and bake for 5 minutes"],
            Image: "Italian-Cloud_Eggs"
        ),
        Recipe(
            Title: "Breakfast Sweet Potatoes",
            Description: "Sweet potatoes for breakfast.",
            Ingredients: ["Sweet potatoes", "Coconut Greek yogurt", "Apple"],
            Steps: ["Preheat oven to 400º", "Place potatoes on baking sheet", "Bake until tender for 45-60 minutes", "Cut an X in each potatoe", "Top with remaining ingrediants"],
            Image: "Breakfast-Sweet-Potatoes"
        ),
        Recipe(
            Title: "Waffle Sandwich",
            Description: "Breakfast for lunch or dinner.",
            Ingredients: ["Bacon", "Egg", "Multigrain Waffles", "Cheddar Cheese", "Turkey"],
            Steps: ["Preheat the griddle over medium heat", "Spread the preserves over the waffles", "Layer with turkey, ham, cheese and bacon", "Top with remaining waffles", "Lightly spread the outsides of the waffle with butter", "Place sandwiches on griddle and cook for 5 minutes"],
            Image: "Waffle-Sandwich"
        ),
        Recipe(
            Title: "Eggs & Chorizo Wraps",
            Description: "Spicy sausage, eggs and cheese come together beautifully in this wrap.",
            Ingredients: ["Chorizo", "Eggs", "Flour Tortillas"],
            Steps: ["Remove chorizo from casings", "In heavy skillet, cook chorizo over medium heat until cooked through", "Drain and return to pan", "In small bowl, whisk eggs and milk until blended", "Add egg mixture to chorizo", "Cook and stir until eggs are thickened and no liquid egg remains", "Stir in cheese. Spoon 1/2 cup egg mixture across center of each tortilla", "Add toppings of your choice and fold bottom and sides of tortilla over filling and roll up"],
            Image: "Eggs-and-Chorizo"
        ),
        Recipe(
            Title: "Banana Oatmeal Pancakes",
            Description: "These pancakes have less sodium per serving than other pancakes made from mixes.",
            Ingredients: ["Pancake Mix", "Banana", "Old-fashioned Oats", "Walnuts"],
            Steps: ["Prepare the pancake batter according to package directions", "Stir in the banana oats and walnuts", "Coat a hot griddle with cooking spray and pour batter by 1/4 cupfuls onto the prepared griddle", "Cook until bubbles start to form and pop on the pancake tops and the pancake bottoms turn golden brown", "Flip the pancakes. Cook until the second sides of the pancakes are golden brown"],
            Image: "Banana-Oatmeal-Pancakes"
        ),
        Recipe(
            Title: "No-bake Cereal bars",
            Description: "Dessert bars! Kids will especially love these easy bars for school.",
            Ingredients: ["Cheerios", "Chex", "Peanut Butter", "Corn Syrup", "Sugar"],
            Steps: ["In a large saucepan, cook and stir sugar and corn syrup until the sugar is dissolved", "Remove from the heat", "Add peanut butter; mix well", "Stir in cereals", "Spread quickly into two lightly greased 15x10x1-in. pans", "Cut into bars while warm"],
            Image: "No-Bake-Cereal-Bars"
        ),
        Recipe(
            Title: "Southwest Tortilla Scramble",
            Description: "A burrito without the added carbs, topped with a dollop of sour cream, hot sauce, bacon bits and, of course, all the cheese you want",
            Ingredients: ["Eggs", "Corn Tortillas", "Salsa", "Pepper"],
            Steps: ["In a large bowl, whisk egg whites, eggs and pepper", "Stir in tortillas, spinach and cheese", "Heat a large skillet coated with cooking spray over medium heat", "Pour in egg mixture; cook and stir until eggs are thickened and no liquid egg remains", "Top with salsa"],
            Image: "Southwest-Tortilla-Scramble"
        ),
        Recipe(
            Title: "Blueberry Muffin French Toast",
            Description: "elevated blueberry French toast for an easy twist on a classic",
            Ingredients: ["Blueberry Muffins", "French Vanilla Nondairy Creamer", "Cinnamon", "Butter"],
            Steps: ["Trim rounded tops off muffins", "Cut remaining muffins crosswise into 1/2-in. slices", "In a shallow bowl, whisk eggs, creamer and cinnamon", "In a large skillet, heat butter over medium heat", "Dip both sides of muffin slices in egg mixture", "Place in skillet; toast 2-3 minutes on each side or until golden brown", "If desired, dust with confectioners' sugar"],
            Image: "Blueberry-Muffin-French-Toast"
        ),
        Recipe(
            Title: "Strawberry Lemoinade Smoothie",
            Description: "A sweet and tangy beverage to take on the go",
            Ingredients: ["Lemonade", "Lemon Yogurt", "Frozen Strawberries"],
            Steps: ["Place all ingredients in a blender", "cover and process 15 seconds or until blended", "Serve immediately"],
            Image: "Strawberry-Lemonade-Smoothie"
        ),
    ]

    var body: some View {
        VStack {
            Text("Recipes")
                .font(.title)
                .fontWeight(.bold)
                .frame(
                    width: UIScreen.main.bounds.width,
                    height: nil
                )
                .padding()
                .background(Color.blue)

            NavigationView {
                List(recipes) {
                    recipe in NavigationLink(destination: RecipeDetailView(recipeDetail: recipe)) {
                        VStack(alignment: .leading, spacing: 20) {
                            VStack(alignment: .leading) {
                                Text("Recipe:")
                                    .font(.title)
                                    .foregroundColor(.teal)
                                Text(recipe.Title)
                                    .font(.title2)
                                    .foregroundColor(.blue)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .fontWeight(.bold)

                            Image(recipe.Image)
                                .resizable()
                                .frame(width: .infinity, height: 200)
                                .shadow(color: .gray, radius: 5, x: 0, y: 5)

                            VStack(alignment: .leading, spacing: 5) {
                                Text("Description:")
                                    .font(.system(size: 22, weight: .medium))
                                Text(recipe.Description)
                                    .font(.system(size: 18, weight: .regular))
                            }
                        }
                    }
                    .padding()
                    .border(Color.black)
                    .background(Color.white)
                    .listRowSeparator(.hidden)
                    .navigationTitle("Tap Recipe To See Full Details")
                } // List End
                .listStyle(PlainListStyle())
            } // Navigation End
        } // VStack End
    }
}

#Preview {
    ListOfRecipes()
}
