require_relative 'score_model'
require_relative 'score_view'

$score = nil

def initialize_score()
  $score = create_score
end

def show_score()
  score_lines = build_score_lines( $score )

  if not score_lines.nil?
    score_lines.each do | line |
      puts line
    end
  end

  return score_lines
end

def store_games()
  $score = add_games( $score )
end

def store_hits()
  $score = add_hits( $score )
end

def store_misses()
  $score = add_misses( $score )
end
