# Native parity inventory

2026-10-25. Paths below are relative to preserved browser reference `C:\Users\janpe\CMPTProjects\cultivationGame3`; they are evidence locations, not runtime dependencies. All native phase states are in the [roadmap](IMPLEMENTATION_PLAN.md). Reuse means intent/data/evidence, not executable TypeScript in Godot.

| Area / reference | Treatment | Native baseline and acceptance destination |
| --- | --- | --- |
| Design, opening, endorsed art/image/prompt | Reuse | Local documents/art copied; native amendments apply. Concept is not shipped art. N6/N8 apply it. |
| `src/height-terrain.ts`, `src/sim.ts`, terrain tests | Redesign sampling; port rules | Native vertex grid exists; browser cell centers differ. N1 freezes surface/query/mutation contract; N2 adds physical cover and swept collision. |
| `src/sim.ts`, `tests/sim.test.ts` | Port algorithms/test intent | Realms, damage/ward/qi, acceleration, dash, guided volley, crescent, delayed Falling Heaven absent. N2; fixture-based numeric comparison with tolerances. |
| `src/content.ts`, `tests/content.test.ts`, loadout tests | Reuse IDs/data; port validation | Native hardcoded starter cast differs. N2 stable validated definitions and host seat presets; no campaign path selection implied. |
| `src/teams.ts`, `src/targeting.ts` | Port predicates; redesign 3D picking | Ally health/hostile locks/self rules and shared terrain effects in N2; altitude/occlusion in N6. |
| `src/session-authority.ts`, authority tests | Port contract | No native authority; N1 local routing, N3 ownership/network validation. Browser actor-0/1 special cases must not leak into generic native rules. |
| `server/spike-server.mjs`, HTTP tests | Redesign | HTTP loopback only. N3 assesses ENet with two actual native processes; no browser server dependency. |
| `src/replication.ts`, replication tests | Port semantics; native wire format | Atomic full join/ordered terrain revisions, bounded packets/rosters; N3. Browser protocol 7 is historical, native version starts explicitly. |
| `src/client-motion.ts`, `src/client-actions.ts` | Port behavior; retune measured constants | N4 prediction/reconciliation/interpolation, separate bounded reliable action stream, freshness/expiry. No native parity yet. |
| M1.P6/P8 handoffs, transport tests | Reuse negative cases; redesign identity adapter | N4 recovery generations, lost replies, duplicates, stale epochs; host exit ends session. No heals/revive/replay. |
| `src/enemy-ai.ts`, enemy tests, M2.P2 | Port bounded flying AI | N5 three skirmishers, max six, committed windup/altitude, cover clearance; no arbitrary navigation claim. |
| `src/encounter.ts`, encounter tests, M2.P3 | Port selected prototype policy | N5 enrollment, leash, return/reset, ally revive, terminal retry/scars. No native implementation currently. |
| M2.P4 preset/team tests | Port | N2 volley/empty/nova and crescent/empty/nova, host-authored persistence across lifecycle; N5 verifies integration. |
| `src/study-*`, `src/depth-scene.ts`, `src/impact.ts`, `src/technique-visuals.ts` | Redesign presentation | N6 Godot camera, scene/VFX/UI/audio/occlusion; keep physical scale and readable effects. Do not port Canvas caches literally. |
| M2.P5a handoff/performance screenshots | Reuse evidence only | Browser mixed 23–60fps observations are not native budgets. Native starter idle 60fps is likewise limited. N6 measured sustained combat gate. |
| Browser localStorage terrain v2 | Defer import; redesign saves | N7 versioned native saves, atomic/recoverable writes and transactions. No full campaign save exists to port. |
| Guardian M2.P5 | New implementation | Unimplemented browser/native. N8a after native parity and performance acceptance. |
| Opening, sect facilities/prosperity, cultivation, story, regions | Reuse design; defer systems | N7–N12 staged new implementation. No existing campaign implementation to convert. |
| Browser deployment/DOM/server/build tooling | Retire as product path | Keep historical runnable reference; N12 native export/distribution replaces it. |
| Original solo personal time dilation | Redesign | Shared authority clock for co-op; no client slowing enemies. Personal art/tuning remains explicit design work. |

Before declaring parity, map named browser regression cases to native tests or document approved behavior differences in a phase handoff. Do not count tests alone: actor counts, target altitude, damage/qi, collision outcomes, scar geometry and lifecycle must match the chosen contract. Native physical terrain improvements are deliberate behavior changes where browser depth had presentation-only or different collision consequences.
