import sys
import os

# 🩻 Ensure local modules like google_adk are found
PROJECT_ROOT = os.path.abspath(os.path.dirname(__file__) + "/..")
if PROJECT_ROOT not in sys.path:
    sys.path.insert(0, PROJECT_ROOT)

# 🧠 These imports must come AFTER sys.path patch
from google_adk.types import ChainConfig
from google_adk.frameworks.chain_runner import ChainRunner

if __name__ == "__main__":
    print("⚙️  Running reflex_validation_test chain...")

    config = ChainConfig.load("reflex_engine/chain.yaml")
    runner = ChainRunner(config)

    outputs = runner.run()

    print("✅ Chain outputs:")
    for step in outputs:
        print(f"{step['agent_name']} → {step['output']}")
