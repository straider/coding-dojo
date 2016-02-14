import copy

GAMES_KEY  = 'games'
HITS_KEY   = 'hits'
MISSES_KEY = 'misses'

def create_score() :
  score = dict()

  score[ GAMES_KEY  ] = 0
  score[ HITS_KEY   ] = 0
  score[ MISSES_KEY ] = 0

  return score

def add_value( score, key ) :
  new_score = copy.deepcopy( score )
  new_score[ key ] += 1

  return new_score

def add_games( score ) :
  return add_value( score, GAMES_KEY )

def add_hits( score ) :
  return add_value( score, HITS_KEY )

def add_misses( score ) :
  return add_value( score, MISSES_KEY )

def get_games( score ) :
  return score[ GAMES_KEY  ]

def get_hits( score ) :
  return score[ HITS_KEY   ]

def get_misses( score ) :
  return score[ MISSES_KEY ]
