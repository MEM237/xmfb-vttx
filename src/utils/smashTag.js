export function generateSmashTag(agentId, sessionId) {
  const timestamp = Date.now();
  const raw = `${agentId}-${sessionId}-${timestamp}`;
  return btoa(raw).slice(0, 32); // simple, symbolic, unique per-message
}

export function reflexLoopCheck(agentA, agentB) {
  if (!agentA || !agentB) return false;
  return agentA.state === "ACTOR_ACTIVE" && agentB.state === "ACTOR_ACTIVE";
}