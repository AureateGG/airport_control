#main_file_spec
require "Airport"

describe Airport do
    describe "#initialization" do
        it "creates empty hangar" do
            airport = Airport.new(10)
            expect(airport.hangar).to eq []  
        end
        
        it "sets hangar capacity to 10" do
            airport = Airport.new(10)
            expect(airport.capacity).to eq (10)
        end

        it "sets default capacity" do
            airport = Airport.new
            expect(airport.capacity).to eq (Airport::DEFAULT_CAPACITY)
        end
    end

    describe "Airport limits landing" do
        it "prevent planes from landing when airport is full" do
        airport = Airport.new(1)
        plane1 = Airplane.new("Messerschmitt")
        plane2 = Airplane.new("Fockewulf")
        plane1.land(airport)
        expect { plane2.land(airport) }.to raise_error "Airport is full!"
        end
    end

    describe "#random" do
        it "generates random weather patterns" do
        airport = Airport.new(1)
        expect(airport.random).to be_between(1, 3)
        end
    end
    
    describe "#storm" do    
        it "should return true or false" do
            expect(subject.storm).to eq(false).or eq(true)
        end
    end   




end


