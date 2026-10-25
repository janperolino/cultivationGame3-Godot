# Build plan

Severed Heaven is being rebuilt as a Windows desktop game in Godot, in phases, and each phase is sized for one Claude Code session. A new session starts clean, reads this file, does one phase, records what it did, and ends. Nothing has to be carried from one session to the next except what is written here, in the code and in the tests.

The game lives in `new-game-project/` (open `project.godot` there; it never moves), and paths in this file are relative to it unless they say otherwise. The rules live in `new-game-project/docs/GAME_DESIGN.md`, the opening in `OPENING_CHAPTER.md`, the look in `ART_DIRECTION.md` and the technical contract (authority, terrain, networking, saves) in `ARCHITECTURE.md`, all under `new-game-project/docs/`. Those local files are the source of truth. The browser game at `C:\Users\janpe\CMPTProjects\cultivationGame3` (GitHub `cultivationCombat3`) is a frozen reference since 2026-10-25: its rules, numbers and tests are oracles to port from, mapped file by file in `docs/PARITY.md`, never runtime code.

## How each session runs

1. Open Claude Code in this folder and say: **"Do phase N1 from plan.md."** (Use the next unticked phase.)
2. Claude reads `CLAUDE.md` (automatic), this file's Status, Open questions and that phase, then only the design and architecture sections the phase lists. It searches by heading rather than reading whole files. It also reads the group of `docs/small-calls.md` for the systems the phase touches (the calls earlier phases made for later ones to revisit, kept out of Open questions), and the browser files the phase names, inspecting rather than blindly copying.
   - **The phase talk** (Jan's call, 2026-10-25): before building, the session talks the phase through with Jan to flesh it out, starting from its "Talk through first" list when it has one. If the phase looks too big for one session, the talk splits it (N2b becomes N2b.1 and N2b.2) and edits this file before building the first half.
   - **What might change it later** (Jan's call, 2026-10-25): a presentation or art phase (N6a, N8d), and any big style change or overhaul, also goes over in its talk what later phases might change about it (the screens they add, the systems that will crowd the HUD, the effects they'll want), so its look leaves room for them rather than being redone.
3. If the phase has a **Before the session** line, Jan does that first. The session checks it and stops if it isn't done.
4. It stays inside the phase. If something comes up that the design doesn't answer, it picks the simplest option that fits, writes it under Open questions (or in `docs/small-calls.md` if it's small) and carries on. It stops to ask only when the answer would change the design. It never invents canon or permanent stakes; those wait for their design session.
5. Content a session drafts (techniques, enemy profiles, loadouts, dialogue) is committed as data and listed in `docs/review-queue.md` (the drafts awaiting Jan's review, newest first). Jan reviews it after the session and leaves notes under Open questions, and the next session applies them before its own phase.
6. The phase is finished when its "Done when" list holds and the checks in `CLAUDE.md` pass: editor import, the headless test suites, and the 120-frame headless scene run, each with a zero exit code. A phase that changes what's on screen also gets a native-window look on D3D12; headless doesn't prove visuals.
7. Before ending, it ticks the phase in Status, adds 3–5 lines to the Log (what was built, decisions made, what the next phase should know), puts any measurements under `docs/phases/` and commits as `N1: <summary>`.
8. Close the session. The next phase starts in a fresh one.

**Design sessions** (D1, D2 and so on) run here like any phase: they settle the open calls their later phases are gated on and edit `GAME_DESIGN.md`, `OPENING_CHAPTER.md` or `ARCHITECTURE.md` directly, then tick, log and commit as `D1: <summary>`.

**Planning sessions** happen between phases whenever Jan wants one. They discuss the design and edit the design docs and `plan.md`, never code. Each one adds a Log line and commits on its own as `design: <summary>`, separate from any phase commit. Sessions may run in parallel, each in its own worktree on its own branch: a worktree session edits only its own phase's lines in this file (its Status tick, its spec, its Log entry), so merges stay clean, and the design sessions, which all edit the design docs, run one at a time on `main`.

**At each milestone's close** (the parity gate after N6b, then each campaign stage), the planning session that opens the next design session compacts this file, since every session reads Status and Open questions: the milestone's phase specs, its Log entries and the Open questions it settled move verbatim to `docs/archive/plan-archive.md`, after any rule that lived only here is written into the design or architecture doc. Open questions keeps what is open, what awaits Jan's review, and what the running milestone settled that its next phases still read; the Log keeps the running milestone in full and one line a phase for the rest.

## Status

**The lines at a glance** (planning, 2026-10-25). Read down a column for a line's order; rows aren't dates. Bold is a design session; ✓ is done.

| Port line (parity)       | Design line                  | Art line                 |
| ------------------------ | ---------------------------- | ------------------------ |
| ✓ N0 Migration planning  | **D1 Worlds and saves** ¹    | A0 Courtyard kit ²       |
| N1 Authority, terrain    | **D2 The opening's calls** ¹ |                          |
| N2a Movement, world      | **D3 The first two paths** ¹ |                          |
| N2b Solo combat          | **D4 Release and hosting** ¹ |                          |
| N3 Two processes         |                              |                          |
| N4a Responsive clients   |                              |                          |
| N4b Recovery             |                              |                          |
| N5a Skirmish AI          |                              |                          |
| N5b Encounter lifecycle  |                              |                          |
| N6a Presentation slice   |                              | ← A0's kit lands here    |
| N6b Parity gate          |                              |                          |
| →                        | **The campaign** ³           |                          |

¹ Any time before the phase it gates (D1 before N7, D2 before N8, D3 before N9, D4 before N12), never in parallel with another design session. ² Proposed, awaiting Jan's yes (Open questions). ³ Needs N6b and D1; the lines join here.

*The port line* (the browser's proven combat and co-op, rebuilt natively; specs under The phases):

- [x] N0 Migration planning (native docs, parity inventory, architecture; both repos under version control)
- [ ] N1 Fixed-step authority and terrain contract
- [ ] N2a Movement and the physical world
- [ ] N2b Bounded solo combat
- [ ] N3 Two processes, one authority
- [ ] N4a Responsive clients and actions
- [ ] N4b Recovery and reset safety
- [ ] N5a Skirmish AI and telegraphs
- [ ] N5b The encounter lifecycle
- [ ] N6a The native presentation and art slice
- [ ] N6b The parity and performance gate (closes the migration; the campaign doesn't start before it)

*The design line* (the open calls, each settled before the phase that needs it; Open questions lists what each one covers):

- [ ] D1 Design: worlds, saves and shared rewards (before N7)
- [ ] D2 Design: the opening's open calls (before N8)
- [ ] D3 Design: the first two paths (before N9)
- [ ] D4 Design: release, hosting and hardware (before N12)

*The campaign* (after the parity gate; each stage is expanded into one-session phases at its design session or planning session, the way N1–N6b were):

- [ ] N7 Saves, transactions and travel: N7a saves and world identity, N7b rewards and restoration transactions, N7c connected region travel
- [ ] N8 The opening: N8a the guardian, N8b the sanctuary expedition, N8c fugitives and founding, N8d the opening's art and audio kit
- [ ] N9 Cultivation: N9a method and mastery, N9b the first breakthrough
- [ ] N10 The sect and the world: N10a sect and faction consequences, N10b challenges and duels
- [ ] N11 Production: N11a the tools and content contract, N11b onward the campaign batches to the approved ending
- [ ] N12 Release: N12a hardening, N12b the Windows package and distribution rehearsal (publishing stays a separate call of Jan's)

The campaign stages' first results and exit checks are in the parked migration roadmap, `docs/archive/IMPLEMENTATION_PLAN.md`, until their design sessions write them here.

## Open questions

**Awaiting Jan**

- **A0 Courtyard kit, proposed** (planning, 2026-10-25): paint the source pieces for N6a's one courtyard kit (tree, stone, steps, hall, a node, the player; intact and broken) ahead of time with Jan's image-tool time, the way the concept was made, so N6a assembles and tests rather than waits. Sources and prompts go in an asset manifest per `ART_DIRECTION.md` § Native asset pipeline. Needs Jan's yes before it goes on the line for real.
- **Phases that may need splitting**: N2b (resources and techniques versus teams and presets), N3 (transport choice versus replication), N5b (lifecycle versus revive) and N6a (HUD and input versus the painted kit) each look like more than one session. Their phase talks decide.

**Settled, still read** (Jan's calls carried from the browser game and the migration)

- Windows desktop in Godot 4.7.2, Forward+, Direct3D 12, Jolt, kept until a measurement says otherwise. Browser play is not required.
- Parity is tested with solo and two players. One to four players is a campaign proposal, with four gated by measurements.
- Co-op revive: a living ally holds R, stationary, within 4m in 3D for 2s. The fallen get half their maximum health and qi, zero ward, no invulnerability. Releasing, taking damage, moving, climbing, casting, dodging, leaving range or losing the target interrupts it.
- A party wipe allows an explicit fresh retry with no penalty, and terrain scars stay. Reconnecting never heals, revives or replays actions.
- Friendly fire is off for player health and hostile target locks; terrain destruction by allies still counts. Heavenly Step keeps one shared authoritative clock; no client slows enemies or projectiles.

**For D1, worlds, saves and shared rewards:** who owns a world and a character (host world governance, whether a guest's character travels), shared spending, quest credit and repeated rewards, whether a party can split across regions, production death stakes, and whether browser terrain saves are ever imported.

**For D2, the opening's calls:** who the pursuers are and how the sect fell, who still lives there, the first restoration and its resources, the depth of peaceful activities, the opening's dialogue, and checkpoint return on a wipe.

**For D3, the first two paths:** which two cultivation paths come first, and the final Heavenly Step tuning.

**For D4, release, hosting and hardware:** the party ceiling, minimum Windows hardware, internet relay and NAT, portable archive or installer, signing and the distribution channel.

## The phases

Each spec says what to read, what to build, and what proves it. "Browser" paths are under `C:\Users\janpe\CMPTProjects\cultivationGame3`. Every phase keeps the existing comparison scene runnable until N6a replaces it on purpose.

### N1 Fixed-step authority and terrain contract

**Reads:** `ARCHITECTURE.md` § Simulation and coordinates, § Terrain, collision and aiming; `VERIFICATION.md` § Test layers 1; `PARITY.md`; `scripts/proving_grounds.gd`, `scripts/terrain.gd`, `tests/terrain_smoke.gd`, `project.godot`. Browser `src/sim.ts`, `src/height-terrain.ts`, `src/session-authority.ts` and their tests.

**Talk through first:** where the simulation lives (an autoload or a plain object the scene owns), the test runner's shape, and whether the terrain query matches the mesh by changing the sampling or the triangulation.

**Build:**
- The smallest separate simulation and authority seam for one local actor: finite, bounded movement intent, a seeded clock and state, explicit 60Hz stepping. Input and presentation submit intent and read state; nothing on screen writes to actor or terrain state. Bounded catch-up (proposal: 4 steps a frame) with overload and time debt recorded, never the render delta for rules.
- Terrain schema 1 frozen: a 129×129 vertex depth field on the 512m, 4m grid. Height queries match the drawn triangles, with a stable diagonal, clamped bounds and defined edges. The 12m crater cap kept; revisions and dirty chunks centralised, including chunks that share a border vertex. The difference from the browser's cell-centre sampling is written down; no browser save import.
- `tests/run_all.gd`, a headless runner that runs every suite and exits nonzero on any failure, so step 6 has one command.

**Done when:**
- The same seed and a 600-tick intent trace give the same state, within a declared tolerance, at 30, 60 and 144 presentation fps, and repeated runs agree. Reading state can't change it. Non-finite or out-of-bounds intent, and intent for an actor the sender doesn't own, are rejected with no change.
- Axis fixtures map browser (x, y, altitude) to Godot (x, altitude, z); diagonals are normalised; world altitude and ground clearance are separate values. Losing focus submits neutral intent. Starter speeds may stay as comparison tuning.
- Both halves of a terrain diagonal, cell and chunk seams, region edges and outside the bounds are tested; queries match the mesh within 0.001m. Repeated digging reaches but never passes 12m; far samples don't change; a border hit marks every dependent chunk; the revision only goes up on a real change.
- The crater smoke test, the new suites, editor import and the 120-frame headless run pass; a native window shows camera, flight and the crater still work.

**Not in this phase:** health, qi or ward, projectiles, dash, enemies, cover colliders, networking, prediction, revive, retry, saves, real art.

### N2a Movement and the physical world

**Reads:** `ARCHITECTURE.md` § Terrain, collision and aiming; `PARITY.md` rows for `sim.ts` and terrain. Browser `src/sim.ts` (acceleration, braking, dash), `tests/clearance.test.ts`, `tests/elevation.test.ts`.

**Build:** acceleration, braking and the qi-cost dash on Shift (replacing fast flight); altitude and clearance; cover with material, height, partial durability and a destroyed state; swept actor tests so dash speed can't tunnel. Jolt shapes are a cache of the canonical terrain and cover; rules never read a stale collider.

**Done when:** headless tests at top speed show no tunnelling and stay finite on slopes, ridges and edges; removing cover changes movement and queries in the same tick; mesh, query and collider revisions are checked against each other. Grounded and sliding behaviour is defined apart from flying clearance.

### N2b Bounded solo combat

**Reads:** `GAME_DESIGN.md` combat sections; `PARITY.md` rows for `sim.ts`, `content.ts`, `teams.ts`, `targeting.ts`. Browser `src/sim.ts`, `src/content.ts`, `src/teams.ts`, `src/targeting.ts`, `tests/sim.test.ts`, `tests/content.test.ts`, `tests/loadouts.test.ts`, `tests/co-op-target.test.ts`.

**Talk through first:** whether to split it (see Open questions), and which browser fixtures become native numeric comparisons and with what tolerances.

**Build:** health, qi, ward and realm math; content definitions with stable IDs, validated before any actor is built; the guided volley, the committed crescent and the palm; teams and the two host presets (volley/empty/nova and crescent/empty/nova); a stationary enemy to hit. Aim projects the cursor onto ground or a valid actor, altitude included.

**Done when:** native tests cover costs and cooldowns, each technique, damage to cover and terrain, allied immunity and locks, and rejecting an unequipped technique, against the named browser fixtures within declared tolerances; a 60-second solo capture is recorded.

### N3 Two processes, one authority

**Reads:** `ARCHITECTURE.md` § Authority, networking and recovery; `VERIFICATION.md` § Test layers 2–3. Browser `src/session-authority.ts`, `src/replication.ts`, their tests, and the M1.P2–P4 handoffs.

**Talk through first:** ENet against the alternatives, the channels, and the wire schema's first version number.

**Build:** a host and a client as two real native processes on loopback; peers mapped to owned actors; bounded schemas checked before anything changes; an atomic join snapshot and ordered terrain revisions. No HTTP, no internet exposure.

**Done when:** two processes move and cast at the same stationary target and agree on resources and scars; a late join is atomic; invalid, oversized and unauthorised packets are rejected; a protocol mismatch says so clearly. The ENet decision and channels are written into `ARCHITECTURE.md`.

### N4a Responsive clients and actions

**Reads:** `ARCHITECTURE.md` § Authority, networking and recovery; `VERIFICATION.md` § Repeatable benchmark gate (network profiles). Browser `src/client-motion.ts`, `src/client-actions.ts`, `tests/client-motion.test.ts`, `tests/reliable-actions.test.ts`, M1.P5 and M1.P8 handoffs, `docs/phases/M1.P10-*`.

**Build:** client prediction, reconciliation and interpolation; a separate bounded reliable action stream with IDs and expiry (starting from the browser's 16 pending, 32 recent, one action a tick, 250ms neutral cutoff).

**Done when:** seeded 50/100/150ms RTT, jitter and 1/2/3% loss profiles show no duplicate damage, motion never erases a cast or dodge, buffers stay bounded, and correction, state age and terrain catch-up are measured. The thresholds are frozen in this phase before it's accepted.

### N4b Recovery and reset safety

**Reads:** `ARCHITECTURE.md` § Authority, networking and recovery (recovery paragraph). Browser M1.P6 and M1.P8 handoffs, `tests/spike-transport.test.mjs`.

**Build:** the native lease and reservation (proposal: 5s and 30s), connection generations and encounter epochs, and what the player sees when the host leaves.

**Done when:** a lost recovery reply is safe to repeat; stale actions, snapshots and resets are rejected; nothing grants health, qi or a revive, and no action replays; input waits for a fresh baseline; a stopped or restarted host needs an explicit new session.

### N5a Skirmish AI and telegraphs

**Reads:** `ARCHITECTURE.md` § Enemies, teams and encounters. Browser `src/enemy-ai.ts`, `tests/enemy-ai.test.ts`, `tests/enemy-replication.test.ts`, M2.P2 handoff and screenshots.

**Build:** host AI for three flying skirmishers, bounded at six: stable IDs, bounded perception and target ties, altitude- and cover-aware flight, committed windups and recovery with warnings that match the real hit.

**Done when:** solo and two-client target fallback, ties, warning release and cancellation, and a six-enemy 3600-tick run all progress; ordinary cover never deadlocks them; the hit corridor matches the warning.

### N5b The encounter lifecycle

**Reads:** `ARCHITECTURE.md` § Enemies, teams and encounters; the revive rule under Open questions. Browser `src/encounter.ts`, `tests/encounter.test.ts`, M2.P3 and M2.P4 handoffs.

**Build:** waiting, active, returning, completed and defeated; enrolment that survives disconnects and Leave; the leash (browser: 120m, 3s, 8s fallback) resetting enemies only; the revive rule; retry after victory or wipe with a new epoch and the scars kept.

**Done when:** solo and two players can finish it; the 4m and 2s revive boundary and every interruption are tested, with half resources, no ward and no invulnerability; wipe and retry cost nothing and leave identical scars; inputs from a stale epoch can't cross a reset.

### N6a The native presentation and art slice

**Reads:** `ART_DIRECTION.md` (all), `ARCHITECTURE.md` § Input, camera and UI; browser `src/study-*`, `src/technique-visuals.ts`, M2.P5a handoff and screenshots.

**Talk through first:** What might change it later (step 2), the HUD's layout, and whether A0's pieces are ready.

**Build:** named InputMap actions with rebinding; the HUD (health, qi, ward, altitude and clearance, slots and cooldowns, allies and revive, encounter and connection state, retry); orthographic aim, lock and occlusion fading; luminous effects and first sounds; one painted courtyard kit.

**Done when:** a tree, stone, steps, hall, node and the player read clearly before and after a blast at normal and pulled-back zoom; height, aim and hazards line up; there's no distracting facet grid; reduced motion and UI scale work. No full art overhaul.

### N6b The parity and performance gate

**Reads:** `VERIFICATION.md` (all), `PARITY.md` (all).

**Before the session:** Jan picks the comparison machine and arranges a second human for the two-player playtest.

**Build:** the repeatable benchmark (solo, two clients, six enemies) and the playtest; any bounded fixes it calls for.

**Done when:** the recorded machine meets the budgets in `VERIFICATION.md` (proposal: p95 frame ≤16.7ms, p99 ≤33.3ms, host step p95 ≤8ms); canonical state matches across clients; every named browser regression maps to a native test or an approved difference; feel and readability feedback is written down. This closes the migration; the planning session after it compacts this file.

## Risks

Physical destruction can stall mesh and collider rebuilds or flood replication: dirty-chunk budgets, canonical queries, revisioned transfers and measured mutation limits come before larger regions. D3D12 on integrated GPUs needs real minimum-hardware evidence; a renderer fallback needs visual and physics checks. Jolt isn't deterministic across peers, so one authority stays. Painted sprites and billboards can hide altitude and fight 3D lighting: prove one kit before volume art. Direct UDP doesn't solve NAT or security: cost a relay before promising internet play. A full save is broader than a display snapshot: schemas and transactions come before campaign rewards. Large content ambition needs a measured authoring rate and a finite ending; cut counts rather than drop sect restoration, cultivation, exploration or co-op.

## Log

### Port line

- **N0 Migration planning** (2026-10-25): native docs written in `docs/` (migration, architecture, parity, verification) and the design, opening and art docs copied over with native amendments; the browser docs point here. The starter scene is solo flight, terrain and crater only, placeholder art. Next is N1; no product call blocks it.

### Planning

- **design: version control and this plan** (2026-10-25): the browser M2 work committed and pushed to `cultivationCombat3` (`ca2334e`); `cultivationGame3-Godot` became its own repo, pushed to `cultivationGame3-Godot`. The roadmap, status and workflow folded into this file in the session-per-phase format (Jan's call); the old status, roadmap, workflow, N1 brief, N0 handoff and starter capture are parked in `docs/archive/` (Godot skips it).
