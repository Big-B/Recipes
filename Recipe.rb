class Recipe
    require './Item.rb'

    attr_accessor :instructions
    attr_reader :items

    # Give the recipe a name and initialize the list of ingredients
    def initialize(name)
        @name = name.capitalize
        @items = Hash.new
    end

    # Add an item to the recipe
    def addItem(item)
        if(@items.has_key?(item.name))
            @items[item.name] = @items[item.name].add(item)
            p "Added duplicate item!"
        else
            @items[item.name] = item
        end
    end

    # Remove an item from the recipe
    def removeItem(item)
        if(@items.has_key?(item.name))
            @items.delete(item.name)
        end
    end

    # Print out the list of items
    def print()
        @items.each{ |x,y| p x}
    end

    def ==(other)
        return (other.items == @items) && (instructions == @instructions)
    end

end
