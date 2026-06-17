# Void Stranger Game Recreation

#### Video Demo:  <URL HERE>

## CS50 Final Project

This repository contains my CS50 final project: a recreation of the game "Void Stranger" created by System Erasure using Lua and the LÖVE framework. Although I have never played the original game, I was inspired by its unique mechanics after watching a Eyepatch Wolf video about it on YouTube. The project focuses on implementing the core mechanics, while keeping in mind posibility for scaling it. Its more about architectual overview rather than creating a unique game

---

## About the Project

- **Framework:** [LÖVE](https://love2d.org/) (Lua)
- **Goal:** Recreate the basic mechanics and feel of "Void Stranger"
- **Inspiration:** Void Stranger game, YouTube playthroughs and Void Stranger wiki

---

## Features

- **Movement:** 2D tile based movement
- **VoidStaff:** Main tool for solving puzzles is a magic staff that let you pick tiles from the map, and palce them in other places
- **"Stones":** Pushable objects that blocks player way
- **Hidden mechanic - UI manipulation:** Void stranger has hidden mechanic that I recreated. At some point in the game player can step into UI bar. UI bar is build from tiles that user can rearrange, which give him abbility to **warp between levels** or change lives count
- **Sounds:** Unique soundtrack, and sound effects
---

## Tools
- **Code editor:** Visual studio code
- **Graphics:** Aseprite
- **Music:** JummBox 
- **Sound effects**: Bfxr


## Getting Started

### Requirements

- [LÖVE 2D](https://love2d.org/) (version 11.5 or later recommended)
- Lua (included with LÖVE)

### Running the Game

1. Clone the repository:
   ```
   git clone https://github.com/yourusername/void-stranger-game-recreation.git
   ```
2. Navigate to the project directory:
   ```
   cd void-stranger-game-recreation
   ```
3. Run with LÖVE:
   ```
   love .
   ```

---

## Project Structure

- `main.lua` — Entry point
- `assets/` — Fonts, graphics, sounds
- `lib/` — Helper libraries (class, push, state machine)
- `src/` — Game logic, player, levels, states, tiles


---

## Contact

For questions or feedback, please open an issue or contact me via GitHub.
