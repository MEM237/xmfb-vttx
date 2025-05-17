from reflex_engine.agent import ReflexEngineAgent
from google_adk.types import ToolContext

if __name__ == "__main__":
    print("🚀 Reflex Engine Agent Online ::μ~zen\n")
    agent = ReflexEngineAgent()

    while True:
        try:
            user_input = input("Enter reflex (or 'exit'): ").strip()
            if user_input.lower() in ["exit", "quit"]:
                print("👋 Exiting Reflex Engine.")
                break

            input_data = {"reflex": user_input}
            context = ToolContext()
            result = agent.run(input_data, context)
            print("→ Output:", result.output if hasattr(result, "output") else result)

        except Exception as e:
            print("[ERROR]", str(e))
