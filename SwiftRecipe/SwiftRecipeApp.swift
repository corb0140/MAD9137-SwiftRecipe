//
//  SwiftRecipeApp.swift
//  SwiftRecipe
//
//  Created by Mark Corbin on 2024-10-19.
//

import SwiftUI

@main
struct SwiftRecipeApp: App {
    @StateObject private var recipeList = RecipeList()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(recipeList)
        }
    }
}
