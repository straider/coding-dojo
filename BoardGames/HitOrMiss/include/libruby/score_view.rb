require_relative 'score_model'

def build_score_lines( score )
  begin
    lines  = Array.new
    games  = get_games  ( score )
    hits   = get_hits   ( score )
    misses = get_misses ( score )

    lines << 'Game Results:'
    lines << sprintf( "\tGames Played......... %2d"        , games  )
    lines << sprintf( "\tPlayer has won....... %2d time(s)", hits   )
    lines << sprintf( "\tPlayer has miss...... %2d time(s)", misses )

    return lines
  rescue KeyError
    nil
  end
end
