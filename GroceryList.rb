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
        @list[recipe.name] = recipe
        if(!@recipes.include?(recipe))
            @recipes << recipe
        end
    end

    # Remove a recipe from the grocery list
    def removeRecipe(recipe)
        @list.delete(recipe.name)
    end

end

beef = Item.new("Beef", 1)
chicken = Item.new("Chicken", 3)
cheese = Item.new("Swiss", 2)
spaghetti = Item.new("Spaghetti Noodles", 1)
sauce = Item.new("Ragu", 1)

chicken_recipe = Recipe.new("Chicken")
chicken_recipe.addItem(chicken)
chicken_recipe.addItem(cheese)
spaghetti_recipe = Recipe.new("Spaghetti")
spaghetti_recipe.addItem(beef)
spaghetti_recipe.addItem(spaghetti)
spaghetti_recipe.addItem(sauce)

spaghetti_recipe.print()
grocery = GroceryList.new()
grocery.addRecipe(chicken_recipe)
grocery.addRecipe(spaghetti_recipe)

file = File.open("List", 'w+')
Marshal.dump(grocery, file)
file.pos = 0
grocery = Marshal.load(file)
