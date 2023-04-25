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

  describe "#most_rides" do
    it "finds the biker with the most rides" do
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

      expect(bike_club.most_rides).to eq(biker1)
    end
  end

  describe "#best_time(ride)" do
    it "finds the biker with the best time for that ride" do
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

      expect(bike_club.best_time(ride1)).to eq(biker1)
    end

    it "finds the biker with the best time for that ride" do
      bike_club = BikeClub.new("Boulder BC")

      biker1 = Biker.new("Kenny", 30)
      biker1.learn_terrain!(:gravel)
      biker1.learn_terrain!(:hills)

      biker2 = Biker.new("Athena", 15)
      biker2.learn_terrain!(:gravel)
      biker2.learn_terrain!(:hills)

      biker3 = Biker.new("Michael", 30)
      biker3.learn_terrain!(:gravel)
      biker3.learn_terrain!(:hills)

      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

      biker1.log_ride(ride1, 92.5)
      biker1.log_ride(ride1, 91.1)
      biker1.log_ride(ride2, 60.9)
      biker1.log_ride(ride2, 61.6)
      biker2.log_ride(ride1, 95.0)
      biker2.log_ride(ride2, 65.0)
      biker3.log_ride(ride1, 95.0)
      biker3.log_ride(ride1, 85.0)
      biker3.log_ride(ride1, 75.9)
      biker3.log_ride(ride1, 50.0)

      bike_club.add_biker(biker1)
      bike_club.add_biker(biker2)
      bike_club.add_biker(biker3)

      expect(bike_club.best_time(ride1)).to eq(biker3)
    end
  end

  describe "#bikers_eligible(ride)" do
    it "finds the bikers who are eligible for a given ride" do
      bike_club = BikeClub.new("Boulder BC")

      biker1 = Biker.new("Kenny", 30)
      biker1.learn_terrain!(:gravel)
      biker1.learn_terrain!(:hills)

      biker2 = Biker.new("Athena", 15)
      biker2.learn_terrain!(:gravel)
      biker2.learn_terrain!(:hills)

      biker3 = Biker.new("Michael", 30)
      biker3.learn_terrain!(:gravel)

      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

      bike_club.add_biker(biker1)
      bike_club.add_biker(biker2)
      bike_club.add_biker(biker3)

      expect(bike_club.bikers_eligible(ride1)).to eq([biker1])
    end

    it "finds the bikers who are eligible for a given ride" do
      bike_club = BikeClub.new("Boulder BC")

      biker1 = Biker.new("Kenny", 30)
      biker1.learn_terrain!(:gravel)
      biker1.learn_terrain!(:hills)

      biker2 = Biker.new("Athena", 15)
      biker2.learn_terrain!(:gravel)
      biker2.learn_terrain!(:hills)

      biker3 = Biker.new("Michael", 15)
      biker3.learn_terrain!(:gravel)
      biker2.learn_terrain!(:hills)

      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

      bike_club.add_biker(biker1)
      bike_club.add_biker(biker2)
      bike_club.add_biker(biker3)

      expect(bike_club.bikers_eligible(ride1)).to eq([biker1])
    end

    it "finds the bikers who are eligible for a given ride" do
      bike_club = BikeClub.new("Boulder BC")

      biker1 = Biker.new("Kenny", 30)
      biker1.learn_terrain!(:gravel)
      biker1.learn_terrain!(:hills)

      biker2 = Biker.new("Athena", 15)
      biker2.learn_terrain!(:gravel)
      biker2.learn_terrain!(:hills)

      biker3 = Biker.new("Michael", 30)
      biker3.learn_terrain!(:gravel)
      biker3.learn_terrain!(:hills)

      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

      bike_club.add_biker(biker1)
      bike_club.add_biker(biker2)
      bike_club.add_biker(biker3)

      expect(bike_club.bikers_eligible(ride1)).to eq([biker1, biker3])
    end
  end

  describe "#record_group_ride" do
    it "records a group ride" do
      bike_club = BikeClub.new("Boulder BC")

      biker1 = Biker.new("Kenny", 30)
      biker1.learn_terrain!(:gravel)
      biker1.learn_terrain!(:hills)

      biker2 = Biker.new("Athena", 15)
      biker2.learn_terrain!(:gravel)
      biker2.learn_terrain!(:hills)

      biker3 = Biker.new("Michael", 30)
      biker3.learn_terrain!(:gravel)

      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

      bike_club.add_biker(biker1)
      bike_club.add_biker(biker2)
      bike_club.add_biker(biker3)

      expect(bike_club.record_group_ride(ride1)).to eq(
        {
          :start_time => Time,
          :ride => Ride,
          :members => [Bikers],
        }
      )

    end
  end
end