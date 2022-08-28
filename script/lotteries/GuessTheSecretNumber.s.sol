pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "forge-std/console.sol";
import "../../src/lotteries/GuessTheSecretNumber.sol";

contract MyScript is Script {

    function run() public {
        vm.startBroadcast();

        uint256 fee = 1 ether;
        GuessTheSecretNumberChallenge gtsn = new GuessTheSecretNumberChallenge{value: fee}();

        // guess by brute force
        bytes32 answerHash = 0xdb81b4d58595fbbbb592d3661a34cdca14d7ab379441400cbfa1b78bc447c365;
        for (uint8 i = 0; i <= 2**8 - 1; i++) {
            if(keccak256(abi.encodePacked(i)) == answerHash) {
                gtsn.guess{value: fee}(i);
                break;
            }
        }
    }
}