# Plan archive

Closed or superseded parts of `plan.md`, moved here verbatim, newest first.

## The migration roadmap (superseded 2026-10-25)

The N-phase roadmap as written in N0, before `plan.md` took over. `plan.md` now holds N1–N6b's specs; the campaign tables below stay the reference for N7–N12 until their design sessions rewrite them there.


2026-10-25. This is the sole active roadmap. Browser M0–M8 plans are archived history; native N phases have independent acceptance. [Architecture](ARCHITECTURE.md), [parity inventory](PARITY.md), [verification](VERIFICATION.md). No implementation is authorized merely by listing a phase.

### Migration gates

| Phase / state | Dependency and bounded deliverable | Measurable exit check |
| --- | --- | --- |
| N0 — documentation / complete | Inspect both roots; preserve intent; define native architecture, parity and sequence | Local design/art links resolve; starter limits and unresolved policies explicit; next phase brief written. No gameplay port. |
| N1 — authority/terrain contract / next, unimplemented | N0; fixed 60Hz local authority, explicit commands, canonical vertex sampling and revision rules; preserve starter as comparison | [Detailed brief](phases/N1-authority-terrain.md): deterministic fixed-tick replay, axis/surface fixtures, dirty-border and crater cap tests; presentation-rate independence and unchanged comparison entry. |
| N2a — movement and physical world / unimplemented | N1; acceleration/braking/dash, altitude/clearance, durability cover and swept collision | Native headless tests at maximum speed reject tunnelling, slopes/ridges/edges finite; cover removal affects movement/query immediately; mesh/query/collider revision consistency checked. |
| N2b — bounded solo combat / unimplemented | N2a; health/qi/ward/realm math, three techniques, content/teams and two presets, stationary enemy fixture | Native regressions for costs/cooldowns, guided volley, committed crescent and palm, cover/terrain damage, allied immunity/locks and unequipped rejection. Compare named TS fixtures/tolerances; 60s sustained solo capture. |
| N3 — two-process authority/transport / unimplemented | N2b; assess ENet, ownership/schema bounds, two seats, snapshot/terrain replication | Two actual native processes move/cast against same stationary target and agree on resources/scars; late join atomic; invalid/oversize/unauthorized packets rejected; protocol mismatch clear. Loopback only initially. Document ENet decision and channels. |
| N4a — responsive clients/actions / unimplemented | N3; prediction/reconciliation/interpolation, reliable action identity/expiry | Seeded 50/100/150ms RTT, jitter, 1/2/3% loss profiles; no duplicate damage, motion cannot erase cast/dodge; bounded buffers and measured correction/state-age/terrain catch-up. |
| N4b — recovery/reset safety / unimplemented | N4a; native lease/reservation, generations/epochs and host-loss UX | Lost recovery reply idempotent; stale action/snapshot/reset rejected; no health/qi/revive grants or action replay; fresh baseline gates input; host stop/restart requires explicit new session. |
| N5a — skirmish AI/telegraphs / unimplemented | N4b; three enemies, six-enemy bound, altitude/cover-aware flight and committed warnings | Solo/two-client target fallback, ties, warning release/cancellation and six-enemy 3600-tick progress tests; no ordinary-cover deadlock; actual hit corridor matches warning. |
| N5b — encounter lifecycle / unimplemented | N5a; enrollment, leash/return, revive and retry | Complete solo and two-player; exact 4m/2s revive and all interruptions, half resources/no ward, no invulnerability; wipe/retry no penalty, scars identical; leash resets enemies only; stale epoch inputs cannot cross reset. |
| N6a — native presentation/art slice / unimplemented | N5b; desktop input/HUD, orthographic aim/lock/occlusion, luminous VFX/audio and one painted courtyard kit | Tree/stone/steps/hall/node/player before/after blast at normal/pulled-back zoom; readable figures, height/aim/hazards align, no distracting facet grid; reduced-motion and UI scale checks. No full asset overhaul. |
| N6b — parity/performance acceptance / unimplemented | N6a; repeatable solo/two-client/six-enemy benchmark and independent playtest | Pass declared hardware budgets in [verification](VERIFICATION.md), compare canonical state, document feel/readability feedback and remaining deliberate differences. Gate campaign production; failures yield bounded remediation. |

N2a/N2b and N4a/N4b are separate phases, not one large implementation request. Each phase writes its own brief before code and a factual handoff after checks. N6 ends the bounded migration parity gate, not the full game.

### Native campaign production after parity

These stages carry the full game direction forward. Each row is a bounded gate; write smaller implementation briefs when content counts/policies are known. All are unimplemented, not inherited browser progress.

| Stage | Dependencies / bounded first result | Exit and decision gate |
| --- | --- | --- |
| N7a — saves and world identity | N6b; versioned settings/character/world and one stable region, backup/recovery | Restart preserves exact scars/cover/build; interrupted/corrupt/incompatible save fixtures recover without overwriting source; explicit browser import decision. Resolve character/world ownership before implementation. |
| N7b — rewards/restoration transactions | N7a; one inventory/reward/contribution/spend transaction | Duplicate completion/reconnect cannot duplicate reward or charge twice; unauthorized shared spending rejected; guest credit/portability policy selected. |
| N7c — connected region travel | N7b; two test regions, one active party region | Damage A, visit B, restart, return A with same scars; atomic transition handles disconnect; no split-party implementation without a decision. |
| N8a — guardian encounter | N6b; one multi-target guardian with altitude cues and solo/co-op openings | Solo and two players can complete/retreat/retry; readable mechanics under sustained effects; no rewards until N7b. |
| N8b — sanctuary expedition | N7c + N8a; prepare, wilderness route, two-node puzzle, inheritance choice, return | One complete secret-realm expedition without developer controls; explicit instance-reset versus persistent terrain policy; protected quest routes cannot softlock. |
| N8c — fugitives and founding | N8b; approach/shelter, resource recovery, first protective restoration, decision to stay | [Opening](OPENING_CHAPTER.md) solo/co-op playtests show goal comprehension and visible restoration without erased wilderness scars. Resolve pursuit, first restoration and dialogue before final assets. 20–30min is proposed, measure it. |
| N8d — opening art/audio kit | N8c + N6a proven kit; extend original assets across opening | Gameplay-scale readability, intact/ruined/restored states, provenance/license inventory, chapter performance budgets hold. |
| N9a — method/mastery | N8d; choose first two paths, one method and deliberate technique variation each | Distinct viable solo/co-op builds, clear requirements; no automatic use of arena presets as campaign paths. |
| N9b — first breakthrough | N9a; Qi Gathering to Foundation preparation, peaceful support activity, trial | Preparation/insight unlock useful new traversal/combat opportunity; recoverable failure policy approved; no idle grind needed for test. |
| N10a — sect/faction consequences | N9b; two faction interests, one recruited specialist, one restoration stage | Visible access/relationship/prosperity changes; host governance and spending clear; no raids/upkeep simulation yet. |
| N10b — challenge/duel slice | N10a; one repeatable challenge and consensual 1v1 | Stakes/cancel/leave/defeat/reward replay checks; separate tuning; no ranked service. Four-player expansion separately gated by measured budgets and approval. |
| N11a — production tools/content contract | N10b; validate authored encounter/quest/loot/region graphs; measure authoring rate | Set finite region/realm/path counts and ending scope from capacity; detect unreachable quests and missing references before build. |
| N11b onward — campaign batches | N11a; one approved region/story/restoration batch at a time | Fresh-character solo/co-op runs retain geography, quest safety and build viability. Repeat bounded batches to approved ending, then one complete campaign review. No implied infinite content promise. |
| N12a — release hardening | Complete approved campaign; accessibility, remapping, save upgrades, abuse/recovery audit | Chosen minimum hardware and network limits, released-schema fixture migrations, licenses and no campaign blockers. |
| N12b — Windows package/distribution rehearsal | N12a; matching templates, clean-machine export/upgrade/uninstall or portable test | Offline solo and chosen co-op mode run without editor/Node; user data survives update; signing/channel/support/relay cost decisions recorded. Publishing remains a separate authorized action. |

### Risks and fallbacks

Physical destruction can stall mesh/collider rebuilds or flood replication: dirty chunk budgets, canonical queries, revisioned transfers and measured mutation limits before larger regions. D3D12 integrated-GPU compatibility needs actual minimum hardware evidence; fallback renderer changes require visual/physics checks. Jolt is not cross-peer determinism; retain one authority. Painted sprites/billboards can obscure altitude and collide with 3D lighting: verify one kit before volume art. UDP direct hosting does not solve NAT/security: assess relay/service cost before internet commitments. Full save state is broader than a display snapshot: design schemas/transactions before campaign rewards. Large content ambition requires measured authoring and a finite ending; reduce counts rather than abandon sect restoration/cultivation/exploration/co-op.

## N1 brief (folded into plan.md 2026-10-25)


State: ready for implementation; unimplemented. Depends on N0 documentation. Read [status](STATUS.md), [architecture](ARCHITECTURE.md), [parity](PARITY.md), [verification](VERIFICATION.md), current `scripts/proving_grounds.gd`, `scripts/terrain.gd`, `tests/terrain_smoke.gd` and `project.godot`. Browser reference: `src/sim.ts`, `src/height-terrain.ts`, `src/session-authority.ts` and relevant terrain/authority tests; inspect rather than blindly copy.

### Deliverable

Preserve the existing comparison scene as a selectable runnable reference. Add the smallest separate native simulation/authority seam for one local actor, finite bounded movement intent, a seeded clock/state and explicit 60Hz stepping. Presentation/input submit intent and read state; no direct presentation writes to authoritative actor/terrain state. Keep placeholder visuals. Set the tick rate explicitly and document bounded catch-up/overload policy.

Freeze native terrain schema 1 as a vertex-based 129x129 depth field on the existing 512m/4m grid, unless implementation evidence requires a reviewed alternative. Match canonical query heights to the actual triangulated mesh, with stable diagonal orientation, clamped bounds and defined edge behavior. Keep the 12m cap; centralize revisions/dirty chunks including border-sharing vertices. Record deliberate difference from browser cell-center sampling. No automatic browser save import.

Before editing: inspect applicable instructions and both Git states, verify source/untracked asset backup coverage, preserve all uncommitted work. Native destination is the existing nested root, never a new project. Do not reset, commit/push or publish without authorization.

### Exit checks

- Same seed and 600 fixed-tick intent trace produce equivalent state within declared tolerance at 30/60/144 presentation FPS; repeated runs agree. Render reads cannot mutate state. Local authority rejects nonfinite/out-of-bounds intent and illegal actor ownership without mutation.
- Axis fixtures map browser (x,y,altitude) to native (x,altitude,z), normalize diagonal movement and separate world altitude from clearance. Focus loss submits neutral intent. Starter speeds may remain explicitly comparison tuning; do not implement full dash/combat tuning here.
- Test each half of terrain diagonals, cell/chunk seams, region edges and outside bounds; query agrees with mesh surface within 0.001m. Repeated excavation reaches but never exceeds 12m; distant samples unchanged; border mutation marks every dependent chunk; revision only increments on actual mutation.
- Existing crater smoke, new authority/terrain suites, editor import and 120-frame headless scene pass with nonzero failure exits. A native-window visual smoke confirms camera/flight/crater comparison still works under retained Forward+/D3D12/Jolt.
- Handoff lists files, actual checks, surface/sampling decision, trace/tolerance, known limitations and exact N2a starting point. Update status and roadmap truthfully; partial work stays partial.

### Scope boundary

No health/qi/ward, projectiles, dash parity, enemies, cover colliders, ENet, multiplayer, prediction, revive, retry, saves, production assets, campaign content or export changes. Those belong to subsequent phases. N1 is a coherent authority/terrain foundation, not a request to port the entire game.

## Native workflow (replaced by plan.md 2026-10-25)


Read [STATUS](STATUS.md), then the selected phase brief and relevant code/design. [IMPLEMENTATION_PLAN](IMPLEMENTATION_PLAN.md) is the only active roadmap; historical browser plans/handoffs are evidence only. Work one bounded phase at a time in this shared checkout. Native code lives in the existing project folder; browser history is preserved separately.

Before a phase: inspect applicable instructions, working changes and backup coverage; state deliverable/dependencies, acceptance checks, boundaries and decisions. Do not pre-create chats or agents. User authorization for a particular implementation task governs execution; a roadmap checkbox alone does not launch work.

After a phase: record changed behavior/files, actual test results and environment, unresolved limitations/decisions and precise next phase. Update status and checklist. Never inherit a browser passing test count as native verification. If acceptance fails, retain partial status and fix within scope or document the blocker. Product feedback may reopen a phase. No commit/push/publication without authorization.

Keep phase evidence compact; raw benchmark data must include scenario, seed and machine. Preserve original browser handoff dates/metrics. Update native product/design documents when decisions change; do not maintain a second active roadmap in the browser root. Resolve campaign policies at their dependency gates, not by silently inventing them during technical migration.

## Native status (replaced by plan.md 2026-10-25)


2026-10-25. Start here, then [migration](MIGRATION.md) and [build plan](../../plan.md).

- Platform selected: Windows desktop, existing Godot 4.7.2 project, Forward+/D3D12/Jolt retained.
- N0 planning complete: native architecture, parity inventory, roadmap, test strategy and preserved product/art guidance. Gameplay port has not begun.
- Native starter: solo flight/terrain/crater comparison only. Prior smoke/import/render passed; warmed idle 60fps is not combat certification. See [baseline and limitations](MIGRATION.md).
- Browser remains historical reference: bounded M1, M2.P1–P4 and P5a complete, guardian and campaign absent; uncommitted work preserved. Native phases do not inherit browser completion labels.
- Next implementation: [N1 — fixed-step authority and terrain contract](phases/N1-authority-terrain.md). Stop before N2 combat implementation.
- No blocker needs a product decision for N1. Version control in place: native repo at `cultivationGame3-Godot` (root above the project), pushed to `github.com/janperolino/cultivationGame3-Godot` `main`; browser M2 work committed as `ca2334e` and pushed to `github.com/janperolino/cultivationCombat3` `main`.
