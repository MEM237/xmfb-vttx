const iconMap = {
  ZEN_LOOP_CORE: "/assets/icons/ZEN_LOOP_CORE_128.png",
  OBSERVER_REFLEX: "/assets/icons/OBSERVER_REFLEX_128.png",
  AGENT_OFFLINE: "/assets/icons/AGENT_OFFLINE_128.png",
  ACTOR_AWAITING_CLEAR: "/assets/icons/ACTOR_AWAITING_CLEAR_128.png",
  ACTOR_ACTIVE: "/assets/icons/ACTOR_ACTIVE_128.png",
  GATEKEEPER_CLEAR: "/assets/icons/GATEKEEPER_CLEAR_128.png",
  GATEKEEPER_BLOCKED: "/assets/icons/GATEKEEPER_BLOCKED_128.png"
};

export default function getIconForState(stateKey) {
  return iconMap[stateKey] || "/assets/icons/AGENT_OFFLINE_128.png";
}