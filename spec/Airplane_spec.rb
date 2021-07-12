require "Airplane"

describe "#initialization" do
    it "creates a plane with a name" do
        airplane = Airplane.new("Messerschmitt")
        expect(airplane.plane_name).to eq "Messerschmitt"
    end
end


describe "#land" do
    it "responds to land" do
        airplane = Airplane.new("Messerschmitt")
        expect(airplane).to respond_to(:land)
    end

    it "lands an airplane" do
        plane = Airplane.new("Messerschmitt")
        airport = Airport.new(10)
        plane.land(airport)
        expect(airport.hangar).to eq [plane]
    end
    
    it "sets the in_air to false" do
        plane = Airplane.new("Messerschmitt")
        airport = Airport.new(10)
        plane.land(airport)
        expect(plane.in_air).to eq false
    end

    it "raises an error when already landed" do
        plane = Airplane.new("Messerschmitt")
        airport1 = Airport.new(10)
        airport2 = Airport.new(8)
        plane.land(airport1)
        expect { plane.land(airport2) }.to raise_error "Already landed"
    end

    it "raises an error during landing because of and active storm" do
        airport = double(:airport, :capacity => 10, :hangar => [], :active_storm => true)
        plane = Airplane.new("Messerschmitt")
        expect { plane.land(airport) }.to raise_error "There is a storm, you cant land!"
    end
end

describe "#takeoff" do
    it "plane takes off from the airport" do
        plane = Airplane.new("Messerschmitt")
        airport = Airport.new(10)
        plane.land(airport)
        plane.takeoff(airport)
        expect(airport.hangar).to eq []
    end

    it "plane confirms it has left the airport" do
        plane = Airplane.new("Messerschmitt")
        airport = Airport.new(10)
        plane.land(airport)
        expect { plane.takeoff(airport) }.to output("#{plane.plane_name} has left the Airport\n").to_stdout
    end

    it "sets plane in_air to true" do
        plane = Airplane.new("Messerschmitt")
        airport = Airport.new(10)
        plane.land(airport)
        plane.takeoff(airport)
        expect(plane.in_air).to eq true 
    end

    it "raises an error when already taken off" do
        plane = Airplane.new("Messerschmitt")
        airport1 = Airport.new(10)
        plane.land(airport1)
        plane.takeoff(airport1)
        expect { plane.takeoff(airport1) }.to raise_error "Already taken off, need to land first!"
    end

    it "raises an error when trying to take off from different Airport" do
        plane = Airplane.new("Messerschmitt")
        airport1 = Airport.new(10)
        airport2 = Airport.new(4)
        plane.land(airport1)
        expect { plane.takeoff(airport2) }.to raise_error "You are in a different Airport"
    end

    it "raises an error during takeoff because of and active storm" do
        plane = Airplane.new("Messerschmitt")
        airport = double(:airport, :capacity => 10, :hangar => [plane], :active_storm => true)
        expect { plane.takeoff(airport) }.to raise_error "There is a storm, you cant take off!"
    end


end