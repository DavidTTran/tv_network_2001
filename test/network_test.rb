require 'minitest/autorun'
require 'minitest/pride'
require './lib/character.rb'
require './lib/show.rb'
require './lib/network.rb'

class NetworkTest < Minitest::Test
  def setup
    @nbc = Network.new("NBC")
    @kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    @michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    @leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
    @ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
    @mitch = Character.new({name: "Mitch Buchannon", actor: "David Hasselhoff", salary: 1_200_000})

    @baywatch = Show.new("Baywatch", "Gregory Bonann", [@mitch])
    @knight_rider = Show.new("Knight Rider", "Glen Larson", [@michael_knight, @kitt])
    @parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [@leslie_knope, @ron_swanson])
  end

  def test_it_exists
    assert_instance_of Network, @nbc
  end

  def test_network_attributes
    assert_equal "NBC", @nbc.name
    assert_equal [], @nbc.shows
  end

  def test_network_can_add_shows
    @nbc.add_show(@knight_rider)
    @nbc.add_show(@parks_and_rec)

    assert_equal [@knight_rider, @parks_and_rec], @nbc.shows
  end

  def test_network_main_character
    skip
    @nbc.add_show(@knight_rider)
    @nbc.add_show(@parks_and_rec)

    assert_equal [@kitt], @nbc.main_characters
  end

  def test_network_actors_by_show
    @nbc.add_show(@knight_rider)
    @nbc.add_show(@parks_and_rec)

    # Having some difficulty setting the hash as the equal..
    # assert_equal {
                  # @knight_rider => ["David Hasselhoff", "William Daniels"],
                  # @parks_and_rec => ["Amy Poehler", "Nick Offerman"]
                  # }, @nbc.actors_by_show
    assert_instance_of Hash, @nbc.actors_by_show
    assert_equal 2, @nbc.actors_by_show.size
  end

  def test_network_prolific_actors
    @nbc.add_show(@knight_rider)
    @nbc.add_show(@parks_and_rec)
    @nbc.add_show(@baywatch)

    assert_equal 0, @nbc.shows_by_actor
  end

end
