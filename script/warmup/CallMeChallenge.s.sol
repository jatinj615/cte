pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../../src/warmup/CallMe.sol";

contract MyScript is Script {
    function run() public {
        vm.startBroadcast();

        CallMeChallenge callMe = new CallMeChallenge();

        callMe.callme();

        console.log(callMe.isComplete());

        vm.stopBroadcast();
    }
}