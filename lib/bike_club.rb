class BikeClub
  attr_reader :name,
              :bikers

  def initialize(name)
    @name   = name
    @bikers = []
  end

  def add_biker(biker)
    @bikers << biker
  end

  def most_rides
    @bikers.max_by do |biker|
      biker.rides.values.flatten.length
    end
  end

  def best_time(ride)
    best_time = {}

    @bikers.each do |biker|
      best_time[biker] = biker.personal_record(ride)
    end

    best_time.min_by do |biker, personal_record|
      if personal_record == false
        personal_record = 100_000_000_000
      end
      personal_record
      return biker
    end

  end

end