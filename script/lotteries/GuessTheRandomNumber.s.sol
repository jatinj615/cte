pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../../src/lotteries/GuessTheRandomNumber.sol";

contract MyScript is Script {

    function run() public {
        vm.startBroadcast();

        uint256 fee = 1 ether;

        GuessTheRandomNumberChallenge gtrn = new GuessTheRandomNumberChallenge{value: fee}();

        uint8 number = uint8(uint256(vm.load(address(gtrn), bytes32(uint256(0)))));

        gtrn.guess{value: fee}(number);

        vm.stopBroadcast();
    }

}