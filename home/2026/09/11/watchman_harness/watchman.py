from typing import List
from watchman_harness.models import Goal, Plan, Verification, Status

class Watchman:
    """The Theoria Agent: Focused on analysis, verification, and mapping."""
    
    def __init__(self, agent_id: str):
        self.agent_id = agent_id

    def verify_plan(self, goal: Goal, plan: Plan) -> Verification:
        print(f"[Watchman {self.agent_id}] Analyzing plan for goal: {goal.description}")
        # In a real implementation, this would call an LLM.
        # The LLM would be prompted to act as a formal verifier.
        # It should check:
        # 1. Does the plan actually address the goal?
        # 2. Are the steps logically consistent?
        # 3. Does the plan violate any constraints?
        
        # Mock verification
        # Let's simulate a situation where the plan is accepted.
        is_consistent = True
        maps_to_goal = True
        
        analysis = (
            f"The plan proposes {len(plan.steps)} steps. "
            f"Reasoning '{plan.reasoning}' is logically consistent with the goal. "
            f"No constraints from {goal.constraints} are violated."
        )
        
        return Verification(
            status=Status.APPROVED if is_consistent and maps_to_goal else Status.REJECTED,
            analysis=analysis,
            mapping_to_goal=maps_to_goal,
            logical_consistency=is_consistent
        )

    def identify_intent(self, goal: Goal) -> str:
        """Extracts the illocutionary force of the user's request."""
        # Theoria specialist: What is the 'force' of this request?
        return f"The intent is to achieve {goal.description} within the provided constraints."
