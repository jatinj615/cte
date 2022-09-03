pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../../src/lotteries/GuessTheNewNumber.sol";
import "../../src/lotteries/GuessTheNewNumberAttack.sol";

contract MyScript is Script {
    function run() public {
        vm.startBroadcast();

        uint256 fee = 1 ether;

        GuessTheNewNumberChallenge gtnn = new GuessTheNewNumberChallenge{value: fee}();

        GuessTheNewNumberAttack gtnna = new GuessTheNewNumberAttack();

        gtnna.attack{value: fee}(address(gtnn));
    
        vm.stopBroadcast();
    }
}