```
Notes for Mitchel Haan

- crc flow: constuct, reduce, convert
- do fun things with big loud worker bees
    - data, functions, tests
    - boundaries, lifecycles, workers

- core should have predictable outputs for given inputs

reducer takes
- first arg acc
- returns total

Elixir is immutable

messages are always in the order sent
but can be received in any order, by pattern matching (gets the first message matching the pattern)

handle_cast should be simple, i.e. call a reducer

crc: prepare to work, do your work, show your work


First lab:
Implement GenServer in summer.ex

Having a solid core allows for easier property-based testing

A supervisor is really lifecyle management

Workers are dependencies (hexpm library, git repo, path)

Property-based testing with proper

Prefer handle_call in GenServer and check response (backpressure)

Prefer to do property-based testing in the core

```
