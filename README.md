# Gatekeeper One

Difficulty 5/10

Make it past the gatekeeper and register as an entrant to pass this level.

# My Solution

## Gate 1

Use an intermadiary contract so that `tx.origin != msg.sender`

## Gate 2

Call the Gatekeeper contract from the constructor so that code size is equal to 0

## Gate 3

What we know :

- `uint64(0) - 1 = 0xffffff`

- `uint64(bytes8(keccak256(abi.encodePacked(msg.sender))))`

from that we can deduce that:

`bytes8(uint64(_gateKey) = uint64(bytes8(keccak256(abi.encodePacked(msg.sender)))) ^ 0xffffff)`
