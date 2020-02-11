class Character

  attr_reader :name, :actor, :salary

  def initialize(name:, actor:, salary:)
    @name = name
    @actor = actor
    @salary = salary
  end
end
