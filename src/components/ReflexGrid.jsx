import React, { useEffect, useState } from "react";
import AgentCell from "./AgentCell";
import mockAgents from "../data/mockAgents.json";

export default function ReflexGrid() {
  const [agents, setAgents] = useState([]);

  useEffect(() => {
    // Later: fetch from Firestore
    setAgents(mockAgents);
  }, []);

  return (
    <div className="grid grid-cols-3 gap-4 p-4">
      {agents.map(agent => (
        <AgentCell key={agent.id} agent={agent} />
      ))}
    </div>
  );
}