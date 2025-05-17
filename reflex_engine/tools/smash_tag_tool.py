from google_adk.types import Tool

class GenerateHalfSmashTag(Tool):
    name = "generate_half_smash_tag"

    def run(self, input_data: str):
        return f"%smash:gen-{hash(input_data) % 99999}"
