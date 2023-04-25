RSpec.describe BikeClub do
  describe "#initialize" do
    it "exists" do
      bike_club = BikeClub.new("Boulder BC")

      expect(bike_club).to be_a(BikeClub)
      expect(bike_club.name).to eq("Boulder BC")
      expect(bike_club.bikers).to eq([])
    end
  end
end
