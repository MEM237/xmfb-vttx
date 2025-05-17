from google_adk.types import Tool

class LogReflexState(Tool):
    name = "log_reflex_state"

    def run(self, input_data: dict):
        print("[LOG] ReflexState:", input_data)
        return {"status": "logged"}