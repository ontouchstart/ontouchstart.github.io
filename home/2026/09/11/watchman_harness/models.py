from dataclasses import dataclass, field
from typing import List, Optional, Dict, Any
from enum import Enum

class Status(Enum):
    PENDING = "pending"
    APPROVED = "approved"
    REJECTED = "rejected"
    NEEDS_CLARIFICATION = "needs_clarification"

@dataclass
class Action:
    description: str
    parameters: Dict[str, Any] = field(default_factory=dict)

@dataclass
class Plan:
    steps: List[Action]
    reasoning: str
    expected_outcome: str

@dataclass
class Verification:
    status: Status
    analysis: str
    corrections: Optional[List[str]] = None
    mapping_to_goal: bool = False
    logical_consistency: bool = False

@dataclass
class Goal:
    description: str
    constraints: List[str] = field(default_factory=list)
    context: Dict[str, Any] = field(default_factory=dict)
