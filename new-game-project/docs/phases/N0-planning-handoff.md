# N0 — migration planning handoff

Completed 2026-10-25. Documentation only; no gameplay port, project relocation, installation, networking exposure, commit, push or publication.

Native source of truth: status, migration decision/baseline, architecture, parity inventory, sole implementation plan, verification strategy and workflow. Copied and reconciled game design, opening and art guidance; copied endorsed concept and prompt unchanged. README routes future work here. N1 has a bounded implementation brief and explicit exclusions.

Browser README/status/plan/workflow now point to native documentation. Their full pre-update working contents are preserved in `README.browser-history.md` and `docs/{STATUS,IMPLEMENTATION_PLAN,WORKFLOW}.browser-history.md` at the browser root; design/opening/art carry historical notices. Existing phase handoffs, source/tests and uncommitted implementation work remain in place. Historical next-phase statements do not launch browser guardian work.

Validation performed: inspected actual native scripts, terrain test, main scene/configuration references and applicable instruction locations; no AGENTS.md found. Checked 143 local Markdown links in native documents and browser entry/history documents with zero unresolved paths, including the archived checklist anchor. SHA256 comparison confirms concept image and prompt identical to browser originals. Browser documentation `git diff --check` passes. Inspected configuration confirms existing main scene, Forward+, D3D12 and Jolt. Native Git status with filesystem access reports no repository; no repository was created. No new engine/test/performance execution is claimed for this documentation-only change; prior native smoke/render and browser tests are labeled historical evidence.

Risks carried forward: vertex versus browser cell-center terrain and native bilinear versus triangulated-surface mismatch; no native combat/collision/authority/network/persistence yet; no sustained native combat benchmark; no final art acceptance. Open campaign/hosting/hardware decisions are listed in MIGRATION and gated in the roadmap.

Next: N1 only, using `docs/phases/N1-authority-terrain.md`. Verify source/untracked asset backup and native version-control coverage, preserve comparison scene, establish local 60Hz authority and canonical terrain/query/revision contract, run its named checks and stop before N2a. No product choice blocks that phase.
