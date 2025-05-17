from google_adk.types import Tool

class FlushTool(Tool):
    name = "flush"

    def run(self, input_data: dict):
        print("[FLUSH] Blocked reflex:", input_data)
        return {"status": "flushed"}