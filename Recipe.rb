class Recipe
    require './Item.rb'

    def initialize(name)
        @name = name.capitalize
        @items = Hash.new
    end

    def addItem(item)
        if(@items.has_key?(item.name))
            @items[item.name] = @items[item.name].add(item)
            p "Added duplicate item!"
        else
            @items[item.name] = item
        end
    end

end

beefRoll = Recipe.new("Beef Rollup")
beef = Item.new("beef", 0)
tortilla = Item.new("tortilla", 1)
beef2 = Item.new("beef", 2)
beefRoll.addItem(beef)
beefRoll.addItem(tortilla)
beefRoll.addItem(beef2)
p beef.amount
