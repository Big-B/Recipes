class GroceryList
    require './Item.rb'
    require './Recipe.rb'

    # Initialize the list of items
    def initialize()
        @list = Hash.new
        @recipes = Array.new
    end

    # Add a recipe and incorperate the items to the grocery list.
    # This means combining items that are the same and combining their
    # amounts.
    def addRecipe(recipe)
        @list << recipe
        if(!@recipes.include?(recipe))
            @recipes << recipe
        end
    end

    # Remove a recipe from the grocery list
    def removeRecipe(recipe)
        @list.delete(recipe)
    end

end

beef = Item.new("Beef", 1)
spaghetti = Item.new("Spaghetti Noodles", 1)
sauce = Item.new("Ragu", 1)

spaghetti_recipe = Recipe.new("Spaghetti")
spaghetti_recipe.addItem(beef)
spaghetti_recipe.addItem(spaghetti)
spaghetti_recipe.addItem(sauce)

spaghetti_recipe.print()

file = File.open(spaghetti_recipe.name, 'w+')
Marshal.dump(@recipes, file)
file.pos = 0
recipe = Marshal.load(file)
