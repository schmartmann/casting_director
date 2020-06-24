class CastingDirector
  attr_accessor :cast_list
  
  def initialize(actors, characters)
    @actors = actors.shuffle
    @characters = characters.shuffle
    @pairings = {}
  end

  def pair_each_character_with_actor
    while @characters.length > 0
      @characters.each.with_index do |character, index|
        random_actor = @actors.sample
        is_cast = @pairings[random_actor]
        if is_cast
          number_parts = @pairings[random_actor].length
          @pairings[random_actor].push(character)
        else
          @pairings[random_actor] = [character]
        end
        @characters.delete_at(index)
      end
    end
    @pairings
  end

  def cast_parts
    pair_each_character_with_actor
  end
end