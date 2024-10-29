//
//  recipes.swift
//  SwiftRecipe
//
//  Created by Mark Corbin on 2024-10-20.
//

import SwiftUI

struct Recipe: Identifiable {
    var id = UUID()
    let Title: String
    let Description: String
    let Ingredients: [String]
    let Steps: [String]
    let Image: String

    init(id: UUID = UUID(), Title: String, Description: String, Ingredients: [String], Steps: [String], Image: String) {
        self.id = id
        self.Title = Title
        self.Description = Description
        self.Ingredients = Ingredients
        self.Steps = Steps
        self.Image = Image
    }
}

class RecipeList: ObservableObject {
    @Published var recipesArray: [Recipe] = [
        Recipe(
            Title: "Pineapple Coconut Smoothie",
            Description: "If you're a fan of tropical flavors, you will love this pineapple coconut smoothie recipe.",
            Ingredients: ["Frozen Pineapple", "Unsweetened Coconut Milk", "Pineapple Juice", "Yogurt Vanilla", "Honey"],
            Steps: ["Gather ingredients", "Place all into blender", "Process until smooth", "Garnish with pineapple"],
            Image: "https://www.thespruceeats.com/thmb/0UtKVCUEwJKOV_gJhDtNZZqA4lo=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/thespruceeats.com-pineapple-coconut-smoothie-recipe-2096958-step-03-55fd63f13a174cbe9ec57fd27d1a2848.jpg"
        ),
        Recipe(
            Title: "Creamy Strawberry Smoothie",
            Description: "Freshly blended strawberry smoothie is a delightful treat in the afternoon, and it makes a great evening pick-me-up.",
            Ingredients: ["Fresh Strawberries", "Sweetened Condensed Milk", "Cold Water", "Lemon Juice", "Ice Cubes"],
            Steps: ["Gather ingredients", "Hull and wash strawberries", "Blend strawberries, condensed milk and cold water", "Add lemon juice and ice cube until ice is crushed", "Pour into glass and serve"],
            Image: "https://www.thespruceeats.com/thmb/PNjtOKd3Qc4XYAavTaPHOAtR1A4=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/strawberry-creamy-smoothie-getty-2786-x-3577-56a6460d5f9b58b7d0e0c44a.jpg"
        ),
        Recipe(
            Title: "Avocado Mango Smoothie",
            Description: "The juice and mango provide plenty of sweetness, so you won't even notice the slightly savory avocado.",
            Ingredients: ["Avocado", "Frozen mango cubes", "Orange juice", "Water"],
            Steps: ["Gather ingredients", "Combine ingredients in blender", "Whirl until smooth and there are no chunks", "Divide among chilled glasses"],
            Image: "https://www.thespruceeats.com/thmb/RLDzyLxDroJvsLJ4tscR38K8fBQ=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/avocado-mango-smoothie-recipe-3377400-hero-01-5c8d20e846e0fb0001770069.jpg"
        ),
        Recipe(
            Title: "Mixed Berry Smoothie",
            Description: "Smoothie with a mix of your favourite berries.",
            Ingredients: ["Orange Juice", "Fresh or frozen berries", "Plain Unsweetened Yogurt"],
            Steps: ["Gather ingredients", "Put all ingredients in blender and process until smooth", "If not using frozen berries, add ice cubes to thicken things up", "Pour into tall glass and serve immediately"],
            Image: "https://www.thespruceeats.com/thmb/30mNE8tgd51KVSAQQmN7Vm1-_c0=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/mixed-berry-smoothie-2216234-hero-01-86d97765c90f47bba76d98a6d9152b62.jpg"
        ),
        Recipe(
            Title: "Chocolate Banana Smoothie",
            Description: "This chocolate banana smoothie recipe tastes just like a milkshake.",
            Ingredients: ["Ice", "Bananas", "Vanilla Soy Milk", "Vanilla Yogurt", "Chocolate Hazelnut Spread"],
            Steps: ["Place ice in bottom of blender", "Add remaining ingredients", "Puree until smooth", "Serve immediately"],
            Image: "https://www.thespruceeats.com/thmb/mS1_ly_8dpAP5CTWwAkvjn24sqU=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/GettyImages-88179070-5826aff03df78c6f6a67db50.jpg"
        ),
        Recipe(
            Title: "Blueberry Tofu Smoothie",
            Description: "If you are looking for a vegan fruit smoothie or simply one that is made without dairy, this blueberry tofu smoothie is for you.",
            Ingredients: ["Silken Tofu", "Banana", "Soy Milk", "Blueberries", "Honey", " Ice Cubes"],
            Steps: ["Gather all ingredients", "Drain the silken tofu to remove excess water", "Peel and slice banana", "Blend tofu and soy milk for 30 seconds", "Add 1/2 cup of blueberries and process until smooth", "Add remaining blueberries, honey and ice cubes", "Blend until very smooth"],
            Image: "https://www.thespruceeats.com/thmb/y3PzPMkttthZKD2B03x82njrgFo=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/blueberry-tofu-smoothie-recipe-695280-Hero_01-7872ad3697104b3c8bcf370119a61c12.jpg"
        ),
        Recipe(
            Title: "Watermelon Smoothie",
            Description: "Although watermelon might not be the first ingredient you'd choose to add to a smoothie, it makes for one of the most refreshing drinks.",
            Ingredients: ["Seedless Watermelon", "Almond Milk or Soy Milk", "Vanilla Yogurt", "Maple Syrup", "Small Wedges Watermelon", "Srigs Mint"],
            Steps: ["Gather the ingredients", "Cut seedless watermelon in small chuncks", "Line a cookie sheet with waxed paper. Place the fresh-cut watermelon on the cookie sheet, leaving space between the pieces. Cover with plastic wrap and freeze for 1 hour", "Once frozen, measure 3 cups of frozen watermelon and place in a blender. Top the fruit with 1 cup milk, 1/2 cup vanilla yogurt, and 3 tablespoons maple syrup. Blend until smooth", "Serve the watermelon smoothies immediately in chilled glasses"],
            Image: "https://www.thespruceeats.com/thmb/9tCbJ8N6YUeafff_VR_ns7G7Jyo=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/SES-rich-creamy-watermelon-smoothie-recipe-2097116-hero-01-450cba2f67174afca6ee6dc08a29a0bc.jpg"
        ),
        Recipe(
            Title: "Virgin Miami Vice",
            Description: "The Miami vice cocktail is a retro frozen drink created sometime before the popular '80s crime drama that shares its name",
            Ingredients: ["Pineapple Juice", "Coconut Cream", "Half & Half", "Crushed Ice", "Strawberry Puree", "Line Juice", "Simple Syrup", "Strawberry"],
            Steps: ["Gather ingredients", "Place the pineapple juice, coconut cream, half-and-half, and 1/2 cup of ice into a blender", "Blend the mixture until smooth", "Pour the mixture into a highball glass", "Rinse out the blender. Add the strawberry puree, lime juice, simple syrup, and the remaining 1/2 cup of ice", "Blend the mixture until smooth", "Slowly pour the strawberry-lime mixture over the back of a bar spoon on top of the pineapple-coconut mixture", "Garnish with a strawberry. Serve and enjoy"],
            Image: "https://www.thespruceeats.com/thmb/UcYD8DaqD3XrHLLqQjjdGaT6CvI=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/virgin-miami-vice-cocktail-recipe-760381-hero-01-c32465553bb14945bbea4cf4f6060364.jpg"
        ),
        Recipe(
            Title: "Banana Smoothie",
            Description: "This banana smoothie recipe requires just five simple ingredients, all of which you probably already have in your kitchen",
            Ingredients: ["Ripe Bananas", "Vanilla Extract", "Vanilla Yogurt", "Honey", "Ice"],
            Steps: ["Gather the ingredients. Set aside 2 slices of bananas, if desired, to use as garnish", "Pour the ingredients into a blender in the following order: 1 to 3 tablespoons honey, 3/4 teaspoon pure vanilla extract, 2 medium ripe bananas (sliced), 1 1/2 cups vanilla yogurt, and 1/2 cup ice", "Blend, gradually increasing the speed until the mixture is smooth", "Pour the drink into a chilled glass. Garnish each glass with a banana slice, if you prefer. Serve and enjoy"],
            Image: "https://www.thespruceeats.com/thmb/vQxSVpuemdITwhENlavO-TyoWTo=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/SES-banana-smoothie-recipes-759606-hero-01-c3d4bf389b684c408d210cd185825a01.jpg"
        ),
        Recipe(
            Title: "Strawberry Lemonade Smoothie",
            Description: "A sweet and tangy beverage to take on the go",
            Ingredients: ["Lemonade", "Lemon Yogurt", "Frozen Strawberries"],
            Steps: ["Place all ingredients in a blender", "cover and process 15 seconds or until blended", "Serve immediately"],
            Image: "https://www.thespruceeats.com/thmb/sFNQ8AqRurVo28e4Xosj9bTdMyY=/425x300/filters:max_bytes(150000):strip_icc():format(webp)/strawberry-breakfast-smoothie-recipe-2097149-hero-02-5c1d4b2a46e0fb00014bf2ec.jpg"
        ),
    ]

    func addRecipe(_ recipe: Recipe) {
        recipesArray.append(recipe)
    }

    func deleteRecipe(_ recipe: Recipe) {
        recipesArray = recipesArray.filter { $0.id != recipe.id }
    }

    func editRecipe(_ updatedRecipe: Recipe) {
        if let index = recipesArray.firstIndex(where: { $0.id == updatedRecipe.id }) {
            recipesArray[index] = updatedRecipe
        }
    }
}
