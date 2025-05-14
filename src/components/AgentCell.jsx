import React from "react";
import getIconForState from "../utils/presenceMap";
import { generateSmashTag } from "../utils/smashTag";

export default function AgentCell({ agent }) {
  const icon = getIconForState(agent.state);
  const smashTag = generateSmashTag(agent.id, "mockSession");

  return (
    <div className="w-32 h-40 border rounded p-2 flex flex-col items-center shadow">
      <img src={icon} alt={agent.state} className="w-20 h-20" />
      <div className="text-sm font-bold mt-1">{agent.name}</div>
      <div className="text-[10px] text-gray-500 mt-1 break-words">{smashTag}</div>
    </div>
  );
}