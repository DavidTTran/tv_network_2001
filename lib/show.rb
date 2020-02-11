class Show

  attr_reader :name, :creator, :characters

  def initialize(name, creator, characters)
    @name = name
    @creator = creator
    @characters = characters
    @actors = []
  end

  def total_salary
    total = 0
    @characters.each {|character| total += character.salary}
    total
  end

  def highest_paid_actor
    @characters.max_by do |character|
      character.salary
      return character.actor
    end
  end

  def actors
    @characters.sort_by do |character|
      @actors << character.actor
    end
    @actors
  end
end
