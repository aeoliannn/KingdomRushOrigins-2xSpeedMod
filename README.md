# Kingdom Rush Origins — 2x Speed Mod

A vanilla-friendly quality-of-life mod that adds a 2x speed toggle to Kingdom Rush Origins.

## Vanilla-Friendly Design

- **No game files modified** — the mod lives entirely in the save directory
- **Uses the game's built-in `custom_script` hook** — no runtime patches needed
- **Zero file conflicts** — won't interfere with Steam updates or file integrity checks
- **Safe to uninstall** — just delete `mod.lua` from the save folder
- **Native UI** — uses the game's own button rendering (GGOptionsButton) and matches the visual style

## How It Works

The game engine natively supports loading a `custom_script` module from the save directory. This mod hooks into that system to toggle `game.DBG_TIME_MULT` (an existing internal speed multiplier) between `nil` (1x) and `2`.

## Features

- Toggle 2x speed on/off with **F** or a HUD button
- Button blends into the existing HUD layout beside the skip-wave button
- Speed resets to 1x when leaving a level
- Settings persist across game launches


## Installation

**Option A — Automatic (recommended)**
  Double-click `install.bat`

**Option B — Manual**
1. Close the game if running.
2. Press `Win+R`, type `%APPDATA%\kingdom_rush_origins\` and press Enter.
3. Copy `mod.lua` and `settings.lua` into the folder that opens.

*(That folder is usually `C:\Users\YourName\AppData\Roaming\kingdom_rush_origins\`)*

## Controls

| Key / Action | Effect |
|---|---|
| `F` | Toggle 2x speed on/off |
| Click | Toggle via the "1x Speed" / "2x Speed" button in the bottom HUD (beside skip-wave) |

## Notes

- No game files are modified — drops into the save directory only
