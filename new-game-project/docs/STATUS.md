# Current native status

2026-10-25. Start here, then [migration](MIGRATION.md) and [implementation plan](IMPLEMENTATION_PLAN.md).

- Platform selected: Windows desktop, existing Godot 4.7.2 project, Forward+/D3D12/Jolt retained.
- N0 planning complete: native architecture, parity inventory, roadmap, test strategy and preserved product/art guidance. Gameplay port has not begun.
- Native starter: solo flight/terrain/crater comparison only. Prior smoke/import/render passed; warmed idle 60fps is not combat certification. See [baseline and limitations](MIGRATION.md).
- Browser remains historical reference: bounded M1, M2.P1–P4 and P5a complete, guardian and campaign absent; uncommitted work preserved. Native phases do not inherit browser completion labels.
- Next implementation: [N1 — fixed-step authority and terrain contract](phases/N1-authority-terrain.md). Stop before N2 combat implementation.
- No blocker needs a product decision for N1. Version control in place: native repo at `cultivationGame3-Godot` (root above the project), pushed to `github.com/janperolino/cultivationGame3-Godot` `main`; browser M2 work committed locally as `ca2334e` (not yet pushed to its `cultivationCombat3` remote).
