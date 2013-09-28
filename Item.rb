class Item
    attr_reader :name, :amount, :units
    attr_writer :units
    # Get the name of the food to add to the list
    def initialize(name, amount)
        @name = name.capitalize
        @amount = amount
    end

    # If two foods string compare ignoring case, then they are equal
    def ==(other)
        return @name == other.name
    end

    # Set the units of the food you're using
    def setUnits(unit)
        @units = unit
    end

    def add(item)
        @amount = @amount + item.amount
    end

end

=begin
beef = Item.new("Beef")
beef2 = Item.new("beef")
pork = Item.new("pork")

p beef == beef2
p beef == pork
=end
