class CastingDirector
  attr_accessor :cast_list
  
  def initialize(actors, characters)
    @actors = actors.shuffle
    @characters = characters.shuffle
    @pairings = {}
  end

  def pair_each_character_with_actor
    @characters.each.with_index do |character, index|
      # check if there's an actor at this index
      actor = @actors[index] 
      actor_parts = @pairings[actor]
      if actor_parts 
        @pairings[actor].push(character)
      else
        @pairings[actor] = [character]
      end
    end
  end

  def fill_actors_arr
    if @actors.length < @characters.length
      @actors.each do |actor|
        break if @actors.length == @characters.length 
        @actors.push(actor)
      end
    end
  end

  def cast_parts
    fill_actors_arr
    pair_each_character_with_actor
    @pairings
  end
end