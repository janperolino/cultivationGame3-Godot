# Severed Heaven (native Godot)

A co-op cultivation action game for Windows desktop, rebuilt in Godot from a browser prototype. Work goes one phase per session: read `plan.md` (Status, Open questions, then your phase) and follow its "How each session runs".

## Layout

- `plan.md`: the only roadmap, status and log.
- `new-game-project/`: the Godot 4.7.2 project (Forward+, Direct3D 12, Jolt). Never move it or make a second one.
  - `scripts/`, `scenes/`: game code. `scenes/proving_grounds.tscn` is the main scene and the comparison scene.
  - `tests/`: headless test scripts.
  - `docs/`: design (`GAME_DESIGN.md`, `OPENING_CHAPTER.md`, `ART_DIRECTION.md`), the technical contract (`ARCHITECTURE.md`), `PARITY.md`, `VERIFICATION.md`, `MIGRATION.md`, `small-calls.md`, `review-queue.md`, `plan-archive.md`, and `phases/` for handoffs and measurements.
- Browser reference, read-only: `C:\Users\janpe\CMPTProjects\cultivationGame3`. Port rules, numbers and test intent from it; never depend on its files or edit it.

## Checks

Godot console executable: `C:\Users\janpe\Downloads\Godot_v4.7.2-stable_win64.exe\Godot_v4.7.2-stable_win64_console.exe`. From `new-game-project/`, with `$Godot` set to it:

```powershell
& $Godot --headless --path . --editor --quit                 # import
& $Godot --headless --path . --script tests/terrain_smoke.gd # until N1 adds tests/run_all.gd
& $Godot --headless --path . --quit-after 120                # scene runs
```

Each must exit 0 with no script errors in the output. Once `tests/run_all.gd` exists it replaces the second line and runs every suite. Headless doesn't prove visuals; screen-changing phases also open a native window. Don't overwrite `docs/native-study.png` just to rerun a check.

## Conventions

- GDScript, typed where it helps. One unit is one metre, time in seconds. +Y is altitude; browser (x, y) maps to Godot (x, z).
- Rules run in a fixed 60Hz host simulation fed seeded RNG and tick time. Nodes present state and submit intent; they never apply damage or write terrain. No wall-clock, input polling, rendering or file access inside rules.
- Content has stable IDs and is validated before use. Clients are never trusted.
- Commit `.uid` and `.import` files; never `.godot/`, export output or secrets.
- Commits are `N1: <summary>` for phases, `D1: <summary>` for design sessions, `design: <summary>` for planning. End commit messages with the Co-Authored-By line.
