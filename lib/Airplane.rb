
class Airplane 
    attr_reader :plane_name, :in_air

    def initialize(name)
        @plane_name = name
    end

   def land(airport)
        if airport.capacity <= airport.hangar.count    
            fail "Airport is full!"
        elsif @in_air == false
            fail "Already landed"
        elsif airport.active_storm == true
            fail "There is a storm, you cant land!"
        else   
            @in_air = false 
            airport.hangar.push(self)
        end
   end

   def takeoff(airport)
        if airport.active_storm == true
            fail "There is a storm, you cant take off!"
        elsif @in_air == true
            fail "Already taken off, need to land first!"
        elsif airport.hangar.include?(self) == false
            fail "You are in a different Airport"
        else
            airport.hangar.delete(self)
            puts "#{self.plane_name} has left the Airport"
            @in_air = true
        end
   end

   
   
end