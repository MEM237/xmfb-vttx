import yaml

class ChainConfig:
    def __init__(self, chain_data):
        self.chain_data = chain_data

    @staticmethod
    def load(path):
        with open(path, 'r') as f:
            chain_data = yaml.safe_load(f)
        return ChainConfig(chain_data)

    def get_agents(self):
        return self.chain_data.get("agents", [])

class ToolContext:
    def call_tool(self, tool_name, data):
        print(f"🛠️ ToolContext simulated call: {tool_name} with {data}")
        return f"{tool_name}_result"

class AgentOutput(dict):
    pass
