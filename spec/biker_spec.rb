require "spec_helper"

RSpec.describe Biker do
  describe "#initialize" do
    it "exists" do
      biker = Biker.new("Kenny", 30)

      expect(biker.name).to eq("Kenny")
      expect(biker.max_distance).to eq(30)
      expect(biker.rides).to eq({})
      expect(biker.acceptable_terrain).to eq([])
    end
  end

  describe "#learn_terrain!" do
    it "adds terrain to list of acceptable terrain" do
      biker = Biker.new("Kenny", 30)

      expect(biker.acceptable_terrain).to eq([])

      biker.learn_terrain!(:gravel)
      biker.learn_terrain!(:hills)

      expect(biker.acceptable_terrain).to eq([:gravel, :hills])
    end
  end

  describe "#log_ride" do
    it "logs ride to ride list" do
      biker = Biker.new("Kenny", 30)
      biker.learn_terrain!(:gravel)
      biker.learn_terrain!(:hills)

      expect(biker.acceptable_terrain).to eq([:gravel, :hills])

      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

      biker.log_ride(ride1, 92.5)
      biker.log_ride(ride1, 91.1)
      biker.log_ride(ride2, 60.9)
      biker.log_ride(ride2, 61.6)

      expected = {
        ride1 => [92.5, 91.1],
        ride2 => [60.9, 61.6]
      }

      expect(biker.rides).to eq(expected)
    end
  end

  describe "#personal_record" do
    it "finds the riders personal record for the given ride" do
      biker = Biker.new("Kenny", 30)
      # => #<Biker:0x00007fc62ca41150...>
      biker.learn_terrain!(:gravel)
      biker.learn_terrain!(:hills)

      expect(biker.acceptable_terrain).to eq([:gravel, :hills])

      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      # => #<Ride:0x00007fc62ca32a10...>

      ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
      # => #<Ride:0x00007fc62cb42ba8...>

      biker.log_ride(ride1, 92.5)
      biker.log_ride(ride1, 91.1)
      biker.log_ride(ride2, 60.9)
      biker.log_ride(ride2, 61.6)

      expected = {
        ride1 => [92.5, 91.1],
        ride2 => [60.9, 61.6]
      }

      expect(biker.rides).to eq(expected)
      expect(biker.personal_record(ride1)).to eq(91.1)
      expect(biker.personal_record(ride2)).to eq(60.9)
    end
  end
end