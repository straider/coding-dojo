coding-dojo / BoardGames / HitOrMiss
====================================

DojoChallenge to implement a simple Hit or Miss game for 1 human player in console mode. To play this simple game the player has to input the cell reference of a 3 x 3 matrix board to guess where is located the cell that the program randomly selected. The player has 5 attempts ( attempts = ceil( number of cells / 2 ) ) to guess. If the player hits then it's a win, otherwise after all attempts are a miss than it's a loss.

----

# Goals

- Code each variant in less than 6 hours;
- Use distinct source files and gain traction in mixing them all together;
- Gain traction handling user input;
- Gain traction with arrays and maps data structures;
- Gain traction in following high level designs.

## Board View

The board must be outputted to the console in the following format:

```
    A   B   C
  +---+---+---+
1 | . | . | . |
  +---+---+---+
2 | . | . | . |
  +---+---+---+
3 | . | . | . |
  +---+---+---+
```

In this format, there are _special_ characters to represent the board square and the player pieces:

- "." represents an empty board square;
- "X" represents a hit;
- "O" represents a miss.

## Score View

The final score must be outputted to the console in the following format:

```
Game Results:
        Games Played.........  3
        Player has won.......  2 time(s)
        Player has miss...... 10 time(s)
```

# Milestones

Try to accomplish a complete milestone with the maximum effort as such:

| Milestone       | Effort | Description                                 |
|-----------------|-------:|---------------------------------------------|
| Board MVC       |   2 hr | Board Model, View and Controller.           |
| Score MVC       |   1 hr | Score Model, View and Controller.           |
| Game Controller |   2 hr | Main functions and top auxiliary functions. |

## Board Milestones Stages

| Milestone Stages | Effort | Description                                            |
|------------------|-------:|--------------------------------------------------------|
| Board Model      | 30 min | Functions to directly handle the board data structure. |
| Board View       | 30 min | Functions that output the board to the console.        |
| Board Controller | 60 min | Functions provided for use by Game Controller.         |

## Score Milestones Stages

| Milestone Stages | Effort | Description                                            |
|------------------|-------:|--------------------------------------------------------|
| Score Model      | 15 min | Functions to directly handle the score data structure. |
| Score View       | 30 min | Functions that output the score to the console.        |
| Score Controller | 15 min | Functions provided for use by Game Controller.         |

## Game Milestones Stages

| Milestone Stages     | Effort | Description                                     |
|----------------------|-------:|-------------------------------------------------|
| Show Board and Score | 15 min | Just output a clean board and a no games score. |
| Play Game and Hit    | 30 min | Play a game with a board with just one square.  |
| Play Game and Miss   | 60 min | Play a game with a board with three squares.    |
| Play One More Game   | 15 min | Play several games, sequentially.               |

# Variants

For all variants there are common requirements:

- Output the game board in the format shown in section Goals;
- Output the final score in the format shown in section Goals;
- Use several source files instead of just one big file;
- Do not deviate from given high level design of each variant;
- The program must allow for several games to be played sequentially, by asking the player if one wants to play one more time, at the end of each game;
- If player has enough playing the game then program ends by showing the score;
- A move is valid if the cell reference points to an empty square on the board;
- It's not valid if the board cell holds a previous guess;
- A cell reference is made of 2 characters and 2 characters only;
- In any cell reference a digit represents a row and a letter represents a column;
- Valid cell references are:
  - In uppercase. Example: A1;
  - In lowercase: Example: b2;
  - A sequence of digit and non digit. Example: 3C;
  - A sequence of non digit and digit. Example: c3;
- Valid digits range from 1 to size of the board ( defaults to 3 );
- Valid non digits range from A to ASCII order of board size plus order of A ( defaults to C ).

**Note**: since the program must continue to ask for a cell reference until it's valid then, if possible, the program can be aborted by pressing "Esc" key or by pressing "Control" and "C" keys.

## Procedural

### Requirements

- Avoid using global variables;
- Global constants are allowed;
- The board is a two-dimensional square array of pieces;
- The board square is represented by an empty piece;
- The pieces can be a global enumerated or distinct global variables, of type **Character**;
- The pieces are:
  - '.': means it's an empty square;
  - 'O': means that the player has hit a wrong square ( miss );
  - 'X': means that the player has hit the right square;
  - 'x': means that it's the right square but it's hidden from view.
- The score is a map with 3 keys: _games_, _hits_, _misses_.

**Note**: if there's no primitive type Character then use type String.

### Board Model

- Code function **create_board**( number_of_rows, number_of_columns );
- Code function **clear_board**( board );
- Code function **is_valid_row**( board, row_number );
- Code function **is_valid_column**( board, column_number );
- Code function **get_piece**( board, row_number, column_number );
- Code function **set_piece**( board, row_number, column_number, piece ).

### Board View

- Code auxiliary function **build_separator_line**( number_of_rows );
- Code auxiliary function **build_header_line**( number_of_rows );
- Code auxiliary function **build_row_line**( board, row_number );
- Code function **build_board_lines**( board ).

**Attention**: the function **build_row_line**( board, row_number ) depends on **get_piece**( board, row_number, column_number ) to validate if the cell is marked with an 'x'. If so than it's hidden and must not be outputted to the console!

### Board Controller

- Code function **initialize_board**( number_of_rows, number_of_columns );
- Code function **reset_board**();
- Code function **show_board**();
- Code function **is_valid_cell**( row_number, column_letter );
- Code function **is_hit**( row_number, column_letter );
- Code function **mark_cell**( row_number, column_letter ).

**Note**: the functions **initialize_board**( number_of_rows, number_of_columns ) and **reset_board**( board ) must also randomly select a cell and mark it with an 'x' ( hidden ).

**Attention**: the function **mark_cell**( row_number, column_letter ) returns true or false, depending on cell being empty or having hidden piece or not.

### Score Model

- Code function **create_score**();
- Code function **add_hits**( score );
- Code function **add_misses**( score );
- Code function **add_games**( score );
- Code function **get_hits**( score );
- Code function **get_misses**( score );
- Code function **get_games**( score ).

### Score View

- Code function **build_score_lines**( score ).

### Score Controller

- Code function **initialize_score**();
- Code function **show_score**();
- Code function **store_hits**();
- Code function **store_misses**();
- Code function **store_attempts**().

### Game Controller

- Code function **initialize_game**( number_of_rows, number_of_columns );
- Code function **reset_game**();
- Code function **print_board**();
- Code function **ask_cell_reference**();
- Code function **is_valid_cell_reference**( row_number, column_letter );
- Code function **put_piece**( row_number, column_letter );
- Code function **is_win**( row_number, column_letter );
- Code function **has_no_more_attempts**();
- Code function **ask_play_again**();
- Code function **is_valid_answer**( answer );
- Code function **print_score**();
- Code function **play_game**().

**Attention**: there are 2 functions that require input from user:

- **ask_cell_reference**(): must parse a 2-characters wide string, one being a number and the other being a letter, in any order;
- **ask_play_again**(): must parse a string, with length >= 1, and must not accept an empty string.

### Constraints

- Separate source files with board functions;
- Separate source files with score functions;
- Separate source file with game controller functions;
- Separate source file with main function.

The design and the validation of each function was done in TDD mode, by using the following frameworks:

- Use **DocTest** to validate each function / method.

### Notes

## Object Oriented

### Requirements

#### Board View

#### Score View

#### Rules Engine ( Domain Model )

#### Game Controller

### Constraints

- Separate source file with board object;
- Separate source file with score object;
- Separate source file with game rules engine object;
- Separate source file with game controller main object.

### Notes

- Follow TDD Rythm: Red-Green-Refactor;
- Apply Design Patterns, to some version.

## Functional

### Requirements

#### Board View

#### Score View

#### Rules Engine ( Domain Model )

#### Game Controller

### Constraints

### Notes
