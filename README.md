# Lonesome Cowboy

Ludum Dare #22 entry by Julian Raschke <julian@raschke.de>

## Things to try this Ludum Dare

- Turn-based gameplay with animated transitions
- Animations NOT backed by a 0..1 "progress" float each
  - just plain Fixnums instead
- Pixen.app
  - super buggy, maybe shouldn't have built it from git
- Gitbox.app
  - lacks integrated diff view à la Tower, unhappy
- Controller/Model separation
- Generated levels? Preliminary brainstorming...
    - Start with just the player surviving
    - loop:
        - n random reverse movement steps of each character
        - spawn enemies where they would be shot
        - stop if no possible move left
    - Biggest problem is reverse movement, especially with reactions. o_O

- Kittens? :D
