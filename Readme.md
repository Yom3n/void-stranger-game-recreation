# Void Stranger Game Recreation

#### Video Demo:  [I'm an Indie game developer now - CS50 Final Project](https://www.youtube.com/watch?v=Hxf2olNg_rc)


## CS50 Final Project

This repository contains my CS50 final project: a recreation of the game "Void Stranger" created by System Erasure using Lua and the LÖVE framework. Although I have never played the original game, I was inspired by its unique mechanics after watching a Super Eyepatch Wolf video about it on YouTube. The project focuses on implementing the core mechanics, while keeping in mind possibility for scaling it. Its more about architectual overview rather than creating a unique game.

To make game scalable, I had to think how to handle level creation and edition. I decided to create a mapping for every level that can be easily edited by no-technical person. In the future, this layout could easily be exported to a CSV file for editing outside a code editor.

I wanted to avoid an architecture built around a single "god object" filled with endless `if-else` checks. Instead, every tile, object, and player entity manages its own logic and interacts with the game world through abstractions. With this design, adding a new object to the game doesn't require modifying multiple files to handle its behavior.

The biggest issue that I made was having 2 sources of truth for objects coordinates (which caused nasty bug).  While every object stored its own coordinates, the level grid also tracked its state in a two-dimensional table. As a temporary fix, I ensured that whenever an entity's state changes on the level grid, its internal coordinates are updated synchronously.

---

## About the Project

- **Framework:** [LÖVE](https://love2d.org/) (Lua)
- **Goal:** Create a framework for 2d tile based game that is easly expandable
- **Inspiration:** Void Stranger game, YouTube playthroughs and Void Stranger wiki

---

## Features

- **Movement:** 2D tile based movement
- **VoidStaff:** Main tool for solving puzzles is a magic staff that let you pick tiles from the map, and palce them in other places
- **"Stones":** Pushable objects that blocks player way
- **Hidden mechanic - UI manipulation:** Void stranger has hidden mechanic that I recreated. At some point in the game player can step into UI bar. UI bar is build from tiles that user can rearrange, which give him abbility to **warp between levels** or change lives count

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
