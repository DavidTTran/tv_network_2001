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
    @shows.reduce({}) do |actor_by_show, show|
      actor_by_show.update(show => show.actors)
    end
  end

  def shows_by_actor
    require 'pry'; binding.pry
    @shows.reduce({}) do |shows_by_actor, show|
      if shows_by_actor.has_key?(show.actors)
        shows_by_actor[show.actors] << show.name
      else
        shows_by_actor[show.actors] = [show.name]
      end
    end
    shows_by_actor
  end


end
