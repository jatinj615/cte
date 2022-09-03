pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../../src/lotteries/PredictTheFuture.sol";
import "../../src/lotteries/PredictTheFutureAttack.sol";

contract MyScript is Script {

    function run() public {
        vm.startBroadcast();

        PredictTheFutureChallenge ptfc = new PredictTheFutureChallenge{value:1 ether}();

        // random int between 0-9 (only possible solutions)
        uint8 number = 0;

        uint256 fee = 1 ether;

        PredictTheFutureAttack attack = new PredictTheFutureAttack(address(ptfc));
        
        attack.lockIn{value: fee}(number);
        // spam call after 1 block mined
        // attack.attack();
        
        vm.stopBroadcast();
    }

}