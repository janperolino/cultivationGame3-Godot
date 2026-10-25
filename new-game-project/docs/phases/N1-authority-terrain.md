# N1 — fixed-step authority and terrain contract

State: ready for implementation; unimplemented. Depends on N0 documentation. Read [status](../STATUS.md), [architecture](../ARCHITECTURE.md), [parity](../PARITY.md), [verification](../VERIFICATION.md), current `scripts/proving_grounds.gd`, `scripts/terrain.gd`, `tests/terrain_smoke.gd` and `project.godot`. Browser reference: `src/sim.ts`, `src/height-terrain.ts`, `src/session-authority.ts` and relevant terrain/authority tests; inspect rather than blindly copy.

## Deliverable

Preserve the existing comparison scene as a selectable runnable reference. Add the smallest separate native simulation/authority seam for one local actor, finite bounded movement intent, a seeded clock/state and explicit 60Hz stepping. Presentation/input submit intent and read state; no direct presentation writes to authoritative actor/terrain state. Keep placeholder visuals. Set the tick rate explicitly and document bounded catch-up/overload policy.

Freeze native terrain schema 1 as a vertex-based 129x129 depth field on the existing 512m/4m grid, unless implementation evidence requires a reviewed alternative. Match canonical query heights to the actual triangulated mesh, with stable diagonal orientation, clamped bounds and defined edge behavior. Keep the 12m cap; centralize revisions/dirty chunks including border-sharing vertices. Record deliberate difference from browser cell-center sampling. No automatic browser save import.

Before editing: inspect applicable instructions and both Git states, verify source/untracked asset backup coverage, preserve all uncommitted work. Native destination is the existing nested root, never a new project. Do not reset, commit/push or publish without authorization.

## Exit checks

- Same seed and 600 fixed-tick intent trace produce equivalent state within declared tolerance at 30/60/144 presentation FPS; repeated runs agree. Render reads cannot mutate state. Local authority rejects nonfinite/out-of-bounds intent and illegal actor ownership without mutation.
- Axis fixtures map browser (x,y,altitude) to native (x,altitude,z), normalize diagonal movement and separate world altitude from clearance. Focus loss submits neutral intent. Starter speeds may remain explicitly comparison tuning; do not implement full dash/combat tuning here.
- Test each half of terrain diagonals, cell/chunk seams, region edges and outside bounds; query agrees with mesh surface within 0.001m. Repeated excavation reaches but never exceeds 12m; distant samples unchanged; border mutation marks every dependent chunk; revision only increments on actual mutation.
- Existing crater smoke, new authority/terrain suites, editor import and 120-frame headless scene pass with nonzero failure exits. A native-window visual smoke confirms camera/flight/crater comparison still works under retained Forward+/D3D12/Jolt.
- Handoff lists files, actual checks, surface/sampling decision, trace/tolerance, known limitations and exact N2a starting point. Update status and roadmap truthfully; partial work stays partial.

## Scope boundary

No health/qi/ward, projectiles, dash parity, enemies, cover colliders, ENet, multiplayer, prediction, revive, retry, saves, production assets, campaign content or export changes. Those belong to subsequent phases. N1 is a coherent authority/terrain foundation, not a request to port the entire game.
