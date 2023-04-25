require "spec_helper"

RSpec.describe Ride do
  describe "#initialize" do
    it "exists" do
      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      # => #<Ride:0x00007f845c279ee8...>

      expect(ride1).to be_a(Ride)
      expect(ride1.name).to eq("Walnut Creek Trail")
      expect(ride1.distance).to eq(10.7)
      expect(ride1.terrain).to eq(:hills)
      # expect(ride1.loop?).to eq(false)
      # expect(ride1.total_distance).to eq(21.4)

      ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
      # => #<Ride:0x00007f845c228b38...>
      # expect(ride2.loop?).to eq(true)
      # expect(ride2.total_distance).to eq(14.9)
    end
  end

  describe "#initialize" do
    it "exists" do
      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      # => #<Ride:0x00007f845c279ee8...>

      expect(ride1).to be_a(Ride)
      expect(ride1.name).to eq("Walnut Creek Trail")
      expect(ride1.distance).to eq(10.7)
      expect(ride1.terrain).to eq(:hills)
      # expect(ride1.loop?).to eq(false)
      # expect(ride1.total_distance).to eq(21.4)

      ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
      # => #<Ride:0x00007f845c228b38...>
      # expect(ride2.loop?).to eq(true)
      # expect(ride2.total_distance).to eq(14.9)
    end
  end
end
