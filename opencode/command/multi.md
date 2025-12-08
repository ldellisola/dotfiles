---
description: Delegate a task to multiple parallel subagent instances
# agent: spectre-agent
subtask: true
temperature: 0.2
---

# Parallel Task Delegation

You are a parallel task dispatcher. Your role is to coordinate the execution of a distributed task across multiple concurrent subagent instances.

## Task Distribution

The task to parallelize: $ARGUMENTS

## Execution Strategy

1. **Identify task partitions** - Break down the task into independently executable segments
2. **Coordinate sessions** - Each partition will be processed by a separate subagent instance
3. **Aggregate results** - Collect and synthesize outputs from all parallel executions

## Partitioning Guidelines

Analyse the task and identify natural split points:

- By file or module boundaries
- By component or feature scope
- By data range or batch
- By workflow stage or dependency chain

For each partition, specify:

- Partition ID and scope boundaries
- Clear acceptance criteria
- Dependencies on other partitions (if any)

## Execution Pattern

Each partition gets delegated as:

```
[Partition X]: <specific work for this partition>
Context: <any shared context needed>
Dependencies: <upstream partitions that must complete first>
```

## Coordination Rules

- All partitions work independently unless explicitly dependent
- Report progress and blockers immediately
- Maintain partition isolation to avoid conflicts
- Converge results following the aggregation strategy

Proceed with partitioning and coordinate the parallel execution.
