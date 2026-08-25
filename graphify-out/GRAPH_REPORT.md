# Graph Report - arch-config  (2026-08-23)

## Corpus Check
- Large corpus: 4158 files · ~670,147 words. Semantic extraction will be expensive (many Claude tokens). Consider running on a subfolder.

## Summary
- 81 nodes · 31 edges · 55 communities (40 shown, 15 thin omitted)
- Extraction: 100% EXTRACTED · 0% INFERRED · 0% AMBIGUOUS
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- EasyEffects Audio Presets
- Program Packages Installer
- AutoInstaller Orchestration
- SDDM Sugar Dark Theme
- Alacritty Terminal Setup
- AutoKey Automation Scripts
- Bash Shell Configuration
- Pacman Mirrors Config
- Picom Compositor Setup
- Qtile Window Manager
- Arch Setup Documentation
- Rofi Theme Setup
- SDDM Display Manager Setup
- Rofi Theme Setup
- Yay AUR Helper Installer
- Graphify Knowledge System
- EasyEffects Audio Presets
- Pkg Arch Config

## God Nodes (most connected - your core abstractions)
1. `install.sh script` - 4 edges
2. `AutoInstaller.sh script` - 2 edges
3. `run_module()` - 2 edges
4. `check_installation()` - 2 edges
5. `check_impulse_response_directory()` - 2 edges
6. `install_presets()` - 2 edges
7. `ProgramsInstaller.sh script` - 2 edges
8. `draw_progress()` - 2 edges
9. `SDDM Sugar Dark Theme Configuration` - 2 edges
10. `AlacrittyInstaller.sh script` - 1 edges

## Surprising Connections (you probably didn't know these)
- `SDDM Sugar Dark Theme Configuration` --references--> `SDDM Sugar Dark Background Wallpaper`  [EXTRACTED]
  SDDM/sugar-dark/README.md → SDDM/sugar-dark/Background.jpg
- `SDDM Sugar Dark Theme Configuration` --references--> `SDDM Sugar Dark Vector Illustration`  [EXTRACTED]
  SDDM/sugar-dark/README.md → SDDM/sugar-dark/Illustration.svg

## Import Cycles
- None detected.

## Communities (55 total, 15 thin omitted)

### Community 0 - "EasyEffects Audio Presets"
Cohesion: 0.43
Nodes (4): check_impulse_response_directory(), check_installation(), install_presets(), install.sh script

### Community 1 - "Program Packages Installer"
Cohesion: 0.50
Nodes (4): draw_progress(), FAILED_PACKAGES_LOG, INPUT_FILE, ProgramsInstaller.sh script

### Community 3 - "SDDM Sugar Dark Theme"
Cohesion: 0.67
Nodes (3): SDDM Sugar Dark Background Wallpaper, SDDM Sugar Dark Vector Illustration, SDDM Sugar Dark Theme Configuration

## Knowledge Gaps
- **19 isolated node(s):** `AlacrittyInstaller.sh script`, `AutokeyInstaller.sh script`, `BashInstaller.sh script`, `MirrorsInstaller.sh script`, `PicomInstaller.sh script` (+14 more)
  These have ≤1 connection - possible missing edges or undocumented components.
- **15 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **What connects `AlacrittyInstaller.sh script`, `AutokeyInstaller.sh script`, `BashInstaller.sh script` to the rest of the system?**
  _19 weakly-connected nodes found - possible documentation gaps or missing edges._