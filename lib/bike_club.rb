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
    best_times = {}

    @bikers.each do |biker|
      if biker.personal_record(ride) == false
        best_times[biker] = Float::INFINITY
      else
        best_times[biker] = biker.personal_record(ride)
      end
    end

    best_time = best_times.min_by do |biker, personal_record|
      personal_record
    end

    best_time[0]
  end

  def bikers_eligible(ride)
    @bikers.map do |biker|
      biker if (biker.acceptable_terrain.include?(ride.terrain) && biker.max_distance >= ride.total_distance)
    end.compact
  end

end