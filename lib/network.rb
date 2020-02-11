class Network
  attr_reader :name, :shows

  def initialize(name)
    @name = name
    @shows = []
  end

  def add_show(show_object)
    @shows << show_object
  end

  def main_characters
    main_characters = []
    require 'pry'; binding.pry
    @shows.reject do |show|
      show.characters.reject do |character|
        character.name.upcase == nil
        character.salary > 500000

      end
    end
  end

  def actors_by_show
    @shows.reduce({}) do |hash, show|
      hash.update(show => show.actors)
    end
  end


end
