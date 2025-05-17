class BaseAgent:
    def __init__(self, name=None):
        self.name = name or self.__class__.__name__

    def run(self, input_data, tool_context):
        raise NotImplementedError("Subclasses must implement run()")
