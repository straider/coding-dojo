import score_model
import score_view

score = None

def initialize_score() :
  global score

  score = score_model.create_score()

def show_score() :
  if score :
    lines = score_view.build_score_lines( score )

    for line in lines :
      print line

    return lines
  else :
    return None

def store_games() :
  global score

  score = score_model.add_games( score )

def store_hits() :
  global score

  score = score_model.add_hits( score )

def store_misses() :
  global score

  score = score_model.add_misses( score )
