require "spec_helper"

RSpec.describe BikeClub do
  describe "#initialize" do
    it "exists" do
      bike_club = BikeClub.new("Boulder BC")

      expect(bike_club).to be_a(BikeClub)
      expect(bike_club.name).to eq("Boulder BC")
      expect(bike_club.bikers).to eq([])
    end
  end

  describe "#add_biker" do
    it "adds bikers to the bike club" do
      bike_club = BikeClub.new("Boulder BC")

      biker1 = Biker.new("Kenny", 30)
      biker1.learn_terrain!(:gravel)
      biker1.learn_terrain!(:hills)

      biker2 = Biker.new("Athena", 15)
      biker2.learn_terrain!(:gravel)
      biker2.learn_terrain!(:hills)

      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

      biker1.log_ride(ride1, 92.5)
      biker1.log_ride(ride1, 91.1)
      biker1.log_ride(ride2, 60.9)
      biker1.log_ride(ride2, 61.6)
      biker2.log_ride(ride1, 95.0)
      biker2.log_ride(ride2, 65.0)

      bike_club.add_biker(biker1)
      bike_club.add_biker(biker2)

      expect(bike_club.bikers).to eq([biker1, biker2])
    end
  end
end

## Test Setup
# biker1 = Biker.new("Kenny", 30)
# # => #<Biker:0x00007fc62ca41150...>
# biker1.learn_terrain!(:gravel)
# biker1.learn_terrain!(:hills)

# ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
# # => #<Ride:0x00007fc62ca32a10...>

# ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
# # => #<Ride:0x00007fc62cb42ba8...>

# biker1.log_ride(ride1, 92.5)
# biker1.log_ride(ride1, 91.1)
# biker1.log_ride(ride2, 60.9)
# biker1.log_ride(ride2, 61.6)

# expected = {
#   ride1 => [92.5, 91.1],
#   ride2 => [60.9, 61.6]
# }

# expect(biker1.rides).to eq(expected)
# expect(biker1.personal_record(ride1)).to eq(91.1)
# expect(biker1.personal_record(ride2)).to eq(60.9)

# biker2 = Biker.new("Athena", 15)
# # => #<Biker:0x00007fc62cb399e0...>

# biker2.log_ride(ride1, 97.0) #biker2 doesn't know this terrain yet
# biker2.log_ride(ride2, 67.0) #biker2 doesn't know this terrain yet

# expect(biker2.rides).to eq({})

# biker2.learn_terrain!(:gravel)
# biker2.learn_terrain!(:hills)

# biker2.log_ride(ride1, 95.0) # biker2 can't bike this distance
# biker2.log_ride(ride2, 65.0) # biker2 knows this terrain and can bike this distance

# expect(biker2.rides).to eq({ ride2 => [65.0] })
# expect(biker2.personal_record(ride2)).to eq(65.0)
# expect(biker2.personal_record(ride1)).to be false
