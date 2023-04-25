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
      # => #<Biker:0x00007fc62ca41150...>

      expect(biker.acceptable_terrain).to eq([])

      biker.learn_terrain!(:gravel)
      biker.learn_terrain!(:hills)

      expect(biker.acceptable_terrain).to eq([:gravel, :hills])
    end
  end
end