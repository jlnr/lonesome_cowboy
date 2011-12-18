# Lonesome ☆ Cowboy

Chased by thieves and coyotes, all you want to be is alone.

Ludum Dare 22 Entry by Julian Raschke <julian@raschke.de>

## Rules

Each turn, one character moves and automatically shoots from his new position. Can you fight off all your predators?

If you need to, you can skip a turn by hitting Space/Return/Enter/Numpad 5/gamepad button #2.

## Known Bugs

- Levels are randomly generated and not necessarily finishable.
- Sometimes the player will automatically shoot the wrong of two (or more) enemies, tactically.

## Things tried this Ludum Dare

- Turn-based gameplay with animated transitions
- Animations NOT backed by a 0..1 "progress" float each
  - just plain Fixnums instead
- Pixen.app
  - super buggy, maybe shouldn't have built it from git
- Gitbox.app
  - lacks integrated diff view à la Tower, unhappy
- Littering my code with `assert { condition }` and using pry to debug things
  - absolutely awesome
- Controller/Model separation
  - maybe even View?
- Generated levels? Preliminary brainstorming...
    - Didn't have time, but for the Jam...:
    - Start with just the player surviving
    - loop:
        - n random reverse movement steps of each character
        - spawn enemies where they would be shot
        - stop if no possible move left
    - Biggest problem is reverse movement, especially with reactions. o_O
- Kittens? :D
    - Deadline fail!
