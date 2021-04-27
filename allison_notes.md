Notes for Allison Sargente


Day 1
=====

Make public API as skinny as possible
Make as much into cores as possible
"with" can lead to failure

lab 1: create genserver inside summer.ex


do fun things with big loud worker bees
Data, Functions, Test, with Boundaries, Lifecycle, workers
workers are dependencies.
They might be on git, hexpm, or just a separate mix project
These can have their own supervision trees, they could not

Lifecycle is made in Application.ex

Three types of projects:
Hardware
Agnostic
Firmware -- Brings together mutiple hardware (Does config, Lifecycle, glue)

Need clean designs, maximize time in core land / host land

Only places would need firmware expertise would be hardware specific

Boundary's job is to protect the core

@impl Genserver would be saying the contract is in Genserver
@impl true is saying you trust your "use"

Day 2
=====

What's in your accumulator
How you do build it?
Explain what you'll do when you reduce
