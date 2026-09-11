import sys
import os

# Add current directory to sys.path to allow absolute imports
sys.path.append(os.path.dirname(os.path.abspath(__file__)))

from watchman_harness.models import Goal
from watchman_harness.actor import Actor
from watchman_harness.watchman import Watchman
from watchman_harness.orchestrator import HarnessOrchestrator

def main():
    # Define a goal
    goal = Goal(
        description="Build a high-performance distributed key-value store in Rust",
        constraints=["Must use Raft for consensus", "Must support horizontal scaling"],
        context={"priority": "high", "deadline": "2026-12-31"}
    )

    # Initialize the agents
    actor = Actor(agent_id="Praxis_01")
    watchman = Watchman(agent_id="Theoria_01")

    # Initialize the harness
    harness = HarnessOrchestrator(actor=actor, watchman=watchman)

    # Run the harness
    harness.run(goal)

if __name__ == "__main__":
    main()
