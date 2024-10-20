//
//  AddRecipe.swift
//  SwiftRecipe
//
//  Created by Mark Corbin on 2024-10-19.
//

import SwiftUI

struct AddRecipe: View {
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var ingredient: String = ""
    @State private var ingredients: [String] = []
    @State private var step: String = ""
    @State private var steps: [String] = []
    @State private var image: String = ""

    var body: some View {
        Text("Add Recipe")

        Form {
            Section(header: Text("Add Recipe")) {
                VStack {
                    TextField("Title", text: $title)
                    TextField("Description", text: $description)

                    VStack(alignment: .leading) {
                        TextField("Ingredient", text: $ingredient)
                        Button(action: {
                            if !ingredient.isEmpty {
                                ingredients.append(ingredient)
                                ingredient = ""
                            }
                        }) {
                            Text("Add Ingredient")
                        }
                    }

                    VStack(alignment: .leading) {
                        TextField("Step", text: $step)
                        Button(action: {
                            if !step.isEmpty {
                                steps.append(step)
                                step = ""
                            }
                        }) {
                            Text("Add Step")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    AddRecipe()
}
