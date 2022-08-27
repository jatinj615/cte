pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../../src/lotteries/GuessTheNumber.sol";

contract MyScript is Script {

    function run() public {
        vm.startBroadcast();

        uint256 fee = 1 ether;

        GuessTheNumberChallenge gtn = new GuessTheNumberChallenge{value:fee}();

        gtn.guess{value:fee}(42);

        vm.stopBroadcast();
    }
}