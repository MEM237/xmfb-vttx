from google_adk.frameworks.base_agent import BaseAgent
from google_adk.types import ToolContext, AgentOutput

class ReflexEngineAgent(BaseAgent):
    def __init__(self, name="reflex_engine", tools=None):
        super().__init__(name=name)
        self.tools = tools or []

    def get_tools(self):
        return self.tools

    def run(self, input_data: dict, tool_context: ToolContext) -> AgentOutput:
        reflex = input_data.get("reflex")
        result = {
            "reflex_valid": False,
            "tag": None,
            "status": "::μ~zen failed"
        }

        if not reflex:
            return AgentOutput(output={"error": "No reflex input provided."})

        if "%smash-tag" in reflex and "::μ~zen" in reflex:
            tag = tool_context.call_tool("generate_half_smash_tag", reflex)
            tool_context.call_tool("log_reflex_state", {"reflex": reflex, "tag": tag})
            result.update({
                "reflex_valid": True,
                "tag": tag,
                "status": "presence verified"
            })
        else:
            tool_context.call_tool("flush", {"reflex": reflex})
            result["blocked"] = True

        return AgentOutput(output=result)

# Required by ADK runtime
root_agent = ReflexEngineAgent()

