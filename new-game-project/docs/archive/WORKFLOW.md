# Native workflow

Read [STATUS](STATUS.md), then the selected phase brief and relevant code/design. [IMPLEMENTATION_PLAN](IMPLEMENTATION_PLAN.md) is the only active roadmap; historical browser plans/handoffs are evidence only. Work one bounded phase at a time in this shared checkout. Native code lives in the existing project folder; browser history is preserved separately.

Before a phase: inspect applicable instructions, working changes and backup coverage; state deliverable/dependencies, acceptance checks, boundaries and decisions. Do not pre-create chats or agents. User authorization for a particular implementation task governs execution; a roadmap checkbox alone does not launch work.

After a phase: record changed behavior/files, actual test results and environment, unresolved limitations/decisions and precise next phase. Update status and checklist. Never inherit a browser passing test count as native verification. If acceptance fails, retain partial status and fix within scope or document the blocker. Product feedback may reopen a phase. No commit/push/publication without authorization.

Keep phase evidence compact; raw benchmark data must include scenario, seed and machine. Preserve original browser handoff dates/metrics. Update native product/design documents when decisions change; do not maintain a second active roadmap in the browser root. Resolve campaign policies at their dependency gates, not by silently inventing them during technical migration.
