import score_model

def build_score_lines( score ) :
  try :
    lines  = list()
    games  = score_model.get_games  ( score )
    hits   = score_model.get_hits   ( score )
    misses = score_model.get_misses ( score )

    lines.append( 'Game Results:' )
    lines.append( '\tGames Played......... {0:2d}'         .format( games  ) )
    lines.append( '\tPlayer has won....... {0:2d} time(s)' .format( hits   ) )
    lines.append( '\tPlayer has miss...... {0:2d} time(s)' .format( misses ) )

    return lines
  except KeyError :
    return None
