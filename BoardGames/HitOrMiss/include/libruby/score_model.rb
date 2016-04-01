GAMES_KEY  = :games
HITS_KEY   = :hits
MISSES_KEY = :misses

def create_score()
  score = Hash.new

  score[ GAMES_KEY  ] = 0
  score[ HITS_KEY   ] = 0
  score[ MISSES_KEY ] = 0

  return score
end

def add_value( score, key )
  new_score = Marshal.load( Marshal.dump( score ) )
  new_score[ key ] += 1
  
  return new_score
end

def add_games( score )
  return add_value( score, GAMES_KEY )
end

def add_hits( score )
  return add_value( score, HITS_KEY )
end

def add_misses( score )
  return add_value( score, MISSES_KEY )
end

def get_value( score, key )
  score.fetch( key )
end

def get_games( score )
  get_value( score, GAMES_KEY )
end

def get_hits( score )
  get_value( score, HITS_KEY )
end

def get_misses( score )
  get_value( score, MISSES_KEY )
end
