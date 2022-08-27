pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../../src/warmup/DeployChallenge.sol";

contract MyScript is Script {

    function run() public {
        vm.startBroadcast();

        DeployChallenge deployChallenge = new DeployChallenge();

        vm.stopBroadcast();
    }
}