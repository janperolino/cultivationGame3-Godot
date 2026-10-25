# Native verification and performance strategy

2026-10-25. Planned checks are not completed tests. Historical starter evidence is in [migration](MIGRATION.md). Browser tests are oracle examples, not native certification.

## Existing smoke commands

From the existing native project root, with `$Godot` set to the 4.7.2 console executable:

```powershell
& $Godot --headless --path . --editor --quit
& $Godot --headless --path . --script tests/terrain_smoke.gd
& $Godot --headless --path . --quit-after 120
```

Record exit codes and parse/error output. Headless rendering does not validate D3D12 visuals; run a native window separately. Do not overwrite `docs/native-study.png` merely to rerun smoke. Add native headless suites as their rules appear, with failures exiting nonzero. Existing `assert` tests require assertions enabled; exported release test runners must use explicit failure reporting.

## Test layers

1. Pure rules: fixed-seed replay at identical tick/command sequence, metre/axis/altitude fixtures, finite/bounded input, cooldown/qi/ward/realm math, high-speed swept collisions and canonical terrain sampling. Float comparisons use declared per-case tolerances; do not require bitwise Jolt/TS equivalence.
2. Authority/content: actor ownership, schema validation before state mutation, team/equipment rejection, queue/rate bounds, ordered action deduplication/conflicting IDs/expiry and encounter epoch reset. Test rejected commands leave state unchanged.
3. Transport integration: two real native processes plus a seeded impairment adapter, atomic late join and terrain checksums, packet gaps/reordering/duplicates, action loss/retry, connection generation replacement, stale pages and host restart. Client effects never duplicate authoritative damage. Controlled LAN testing only after loopback; no public port exposure.
4. Lifecycle: solo enrollment, two players, departed-but-enrolled vulnerability, exact revive boundary/interruption, leash fallback, terminal retry preserving scars, no recover-heal/revive/replay. Compare frozen state without stepping to distinguish grants from ordinary qi regeneration.
5. Persistence later: every released schema fixture, interrupted writes at each replace step, corrupt/incompatible records, backups, reward/spend idempotency and A→B→restart→A geography. Exported data path and upgrades tested separately from editor.
6. Playability/visual: normal and wide zoom, elevated/occluded targets, crater edges, ally identification, hazard readability, focused/unfocused controls, reduced motion, text scale, solo and two actual humans. Record feedback without calling one developer's smoke an independent playtest.

## Repeatable benchmark gate

Before N6b acceptance, select and record actual CPU/GPU/RAM, Windows/driver, resolution, power mode, engine/export version, renderer, physics, VSync and test seed/content. Minimum supported hardware remains undecided. Initial engineering target: 60fps at 1280x720 on the recorded comparison machine; p95 frame time ≤16.7ms, p99 ≤33.3ms; host simulation p95 ≤8ms/p99 ≤16.7ms. These are proposed native budgets requiring measurement and review, not accepted production guarantees. Report terrain/mesh/collider rebuild spikes separately; never hide them in average FPS.

Use 30s warmup then 60s measured runs, three repetitions: idle, continuous flight/zoom, stationary-target sustained volley/crescent, repeated largest supported Falling Heaven, three-enemy combat, six enemies plus two players, late join into scarred terrain, impaired network recovery. Log p50/p95/p99 frame and host-step ms, worst stalls, active projectiles/effects, dirty/rebuilt chunks, draw calls/GPU time where available, memory, bytes/s per peer, snapshot/delta sizes, correction magnitude, RTT/state age and full terrain catch-up. A ten-minute repeated-combat soak must show bounded queues/effects and no monotonically retained per-encounter objects; investigate memory growth rather than asserting a universal MB limit without baseline. Export/headless host/client runs distinguish render load from authority load.

Network profiles reproduce 50/100/150ms target RTT with declared jitter and 1/2/3% application loss per direction; record whether simulation drops messages versus true UDP packet loss. Browser M1.P10 budgets/results remain historical comparator evidence at the browser root, not native passing thresholds. Proposed native initial review limits at 150ms/3%: p95 local position error ≤1m, max correction ≤3m, full bounded terrain catch-up ≤5s; no duplicate authoritative actions and exact canonical state agreement after convergence. Freeze final thresholds/profile definition in N4a before acceptance; failures require documented tuning or an explicit design review, not edited-after-the-fact success criteria.

Store scenario/configuration, raw metrics and concise findings under `docs/phases/` with hardware and limitations. Do not rerun unchanged browser suites to certify documentation or Godot. Run import/smoke and relevant native tests for native code changes; this documentation pass checks links/configuration and truth of claims only.
