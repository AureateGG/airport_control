#main file 
require_relative "Airplane.rb"

class Airport
DEFAULT_CAPACITY = 5
    attr_reader :hangar, :capacity, :active_storm

    def initialize(capacity = DEFAULT_CAPACITY)
        @capacity = capacity
        @hangar =[]
    end

    def storm
        random
        if random == 1
            @active_storm = true
        else
            @active_storm = false
        end    
    end

    def random
        random = rand(1..3)
    end
end
