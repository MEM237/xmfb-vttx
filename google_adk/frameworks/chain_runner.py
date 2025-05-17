from importlib import import_module

class ChainRunner:
    def __init__(self, config):
        self.config = config

    def _load_class(self, class_path):
        """Dynamically import a class from a string path."""
        module_path, class_name = class_path.rsplit('.', 1)
        module = import_module(module_path)
        return getattr(module, class_name)

    def run(self):
        outputs = []

        for agent_def in self.config.get_agents():
            class_path = agent_def["class_path"]
            input_data = agent_def.get("input", {})

            AgentClass = self._load_class(class_path)
            agent = AgentClass()

            # Fake a ToolContext (basic stub — expand later if needed)
            class DummyContext:
                def call_tool(self, name, payload):
                    print(f"🛠️ Tool called: {name} with {payload}")
                    return f"{name}_result"

            result = agent.run(input_data, DummyContext())
            outputs.append({
                "agent_name": agent_def["name"],
                "output": result
            })

        return outputs
