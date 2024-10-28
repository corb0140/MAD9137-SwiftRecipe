//
//  ContentView.swift
//  SwiftRecipe
//
//  Created by Mark Corbin on 2024-10-19.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var recipeList = RecipeList()

    var body: some View {
        ListOfRecipes()
            .environmentObject(recipeList)
    }
}

#Preview {
    ContentView()
}
