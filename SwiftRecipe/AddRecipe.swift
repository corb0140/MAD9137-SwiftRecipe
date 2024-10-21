//
//  AddRecipe.swift
//  SwiftRecipe
//
//  Created by Mark Corbin on 2024-10-19.
//

import PhotosUI
import SwiftUI

struct AddRecipe: View {
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var ingredient: String = ""
    @State private var ingredients: [String] = []
    @State private var step: String = ""
    @State private var steps: [String] = []
    @State private var imageUrl: String = "https://billetterie.psg.fr/media/allianz-1.jpg"
    @State private var isSelected: Bool = false

    var body: some View {
        Form {
            Section(header: Text("Add Recipe")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.teal)
            ) {
                VStack(spacing: 15) {
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

                    VStack(alignment: .leading, spacing: 30) {
                        TextField("Image Url", text: $imageUrl)

                        if isSelected == true {
                            if let url = URL(string: imageUrl), !imageUrl.isEmpty {
                                AsyncImage(url: url) {
                                    selectedUrl in
                                    if let image = selectedUrl.image {
                                        image
                                            .resizable()
                                            .frame(width: .infinity, height: 350)
                                            .clipped()
                                    } else {
                                        Text("Loading Image ...")
                                    }
                                }
                            }
                        }

                        Button(action: {
                            if isSelected == false {
                                isSelected = true
                            } else {
                                isSelected = false
                            }
                        }) {
                            Text("View Image")
                                .font(.subheadline)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(5)
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
