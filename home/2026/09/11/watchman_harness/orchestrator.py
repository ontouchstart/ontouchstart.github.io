from watchman_harness.models import Goal, Status
from watchman_harness.actor import Actor
from watchman_harness.watchman import Watchman

class HarnessOrchestrator:
    """The Synthesis: Manages the loop between Actor (Praxis) and Watchman (Theoria)."""
    
    def __init__(self, actor: Actor, watchman: Watchman):
        self.actor = actor
        self.watchman = watchman

    def run(self, goal: Goal):
        print(f"--- Starting Harness for Goal: {goal.description} ---")
        
        # Initial intent analysis by Watchman
        intent = self.watchman.identify_intent(goal)
        print(f"[Orchestrator] Identified Intent: {intent}")
        
        plan = None
        max_iterations = 3
        iteration = 0
        
        while iteration < max_iterations:
            print(f"\n--- Iteration {iteration + 1} ---")
            
            # Actor proposes plan
            plan = self.actor.generate_plan(goal)
            print(f"[Actor] Proposed Plan: {plan.reasoning}")
            
            # Watchman verifies plan
            verification = self.watchman.verify_plan(goal, plan)
            print(f"[Watchman] Analysis: {verification.analysis}")
            
            if verification.status == Status.APPROVED:
                print(f"\n[Orchestrator] Plan APPROVED. Proceeding to execution.")
                for step in plan.steps:
                    self.actor.execute_action(step)
                break
            elif verification.status == Status.REJECTED:
                print(f"[Orchestrator] Plan REJECTED. Requesting correction from Actor.")
            else:
                print(f"[Orchestrator] Plan needs clarification.")
            
            iteration += 1
        else:
            print("\n[Orchestrator] Failed to reach an approved plan within the iteration limit.")

