# 2016.03.25: DRY - Use blocks to build line, where block is separator, header or row.

def build_separator_line( board_size )
  # ( not board_size.nil? and board_size > 0 ) ? '   +' + ( '---+' * board_size ) : nil
  line = nil

  if not board_size.nil? and board_size > 0
    line = '   '

    board_size.times do
      line += "+---"
    end
    line += '+'

  end

  return line
end

def build_header_line( board_size )
  line = nil

  if not board_size.nil? and board_size > 0
    line = '   '

    board_size.times do | iteration |
      letter = ( iteration + 'A'.ord ).chr
      line += "  #{ letter } "
    end
    line += ' '
  end

  return line
end

def build_row_line( board, row_number )
  line = nil

  if not board.nil? and ( 1 .. board.size ).include?( row_number )
    line = " #{ row_number } "
    row  = board[ row_number - 1 ]

    row.each do | cell |
      piece = ( cell == 'x' or cell == '' ) ? '.' : cell
      line += "| #{ piece } "
    end
    line += '|'
  end

  return line
end

def build_board_lines( board )
  lines = nil

  if board.instance_of?( Array ) and board.size > 0
    first_row = board.first
    row_size  = first_row.size
    lines     = Array.new

    separator_line = build_separator_line ( row_size )
    header_line    = build_header_line    ( row_size )
    lines << header_line << separator_line

    board.each_index do | row_index |
      row_number = row_index + 1
      row_line   = build_row_line( board, row_number )
      lines << row_line << separator_line
    end
  end

  return lines
end
