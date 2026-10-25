# Severed Heaven — native Godot

Windows desktop is the selected product target. This is the user's existing Godot 4.7 project, configured with a first playable comparison scene. Open `project.godot` and press **F6/F5** (main scene configured). No browser or Node server is required.

WASD flies relative to the orthographic camera; F/G rise/descend; Shift fast flight; wheel zoom; mouse aim; E or left click drops Falling Heaven within 100m. Its impact excavates the actual height mesh, capped at 12m. Esc quits; F11 toggles fullscreen.

The scene contains a 512m height field based on the original terrain formula, chunked meshes rebuilt only at impacts, instanced placeholder foliage, four courtyard structures, a following orthographic camera and a live frame-rate readout. Existing Forward+/Direct3D12/Jolt choices are retained. No external asset or add-on dependencies.

This is a comparison foundation, not a completed migration. Geometry is placeholder, not the endorsed painted art. Movement is a bounded flight controller with terrain clearance; full terrain/cover collision, enemies, health/qi, existing combat formulas, ally revive, persistence and authoritative co-op have not yet been ported. Browser TypeScript sources/tests remain intact in the sibling cultivationGame3 project as the reference. Godot Y is altitude; original world Y maps to Godot Z.

Validation commands (substitute your Godot executable):

```powershell
& $Godot --headless --path . --editor --quit
& $Godot --headless --path . --script tests/terrain_smoke.gd
& $Godot --headless --path . --quit-after 120
```

Future native work starts at [status](docs/STATUS.md). The [migration decision](docs/MIGRATION.md), [architecture](docs/ARCHITECTURE.md), [parity inventory](docs/PARITY.md), [implementation plan](docs/IMPLEMENTATION_PLAN.md) and [verification strategy](docs/VERIFICATION.md) are authoritative. Product guidance: [game design](docs/GAME_DESIGN.md), [opening chapter](docs/OPENING_CHAPTER.md), [endorsed art](docs/ART_DIRECTION.md). Next implementation is [N1 fixed-step authority and terrain contract](docs/phases/N1-authority-terrain.md); no full gameplay port has begun. ENet is a candidate for native networking; no internet hosting, firewall changes, UPnP or public exposure is configured.
