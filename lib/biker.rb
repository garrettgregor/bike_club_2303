class Biker
  attr_reader :name,
              :max_distance,
              :rides,
              :acceptable_terrain

  def initialize(name, max_distance)
    @name               = name
    @max_distance       = max_distance
    @rides              = {}
    @acceptable_terrain = []
  end

  def learn_terrain!(terrain)
    @acceptable_terrain << terrain
  end

  def log_ride(ride, distance_rode)
    if @rides[ride]
      @rides[ride] << distance_rode
    else
      @rides[ride] = []
      @rides[ride] << distance_rode
    end
  end
end