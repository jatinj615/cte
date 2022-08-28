pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../../src/lotteries/PredictTheBlockHash.sol";

contract MyScript is Script {

    function run() public {

        vm.startBroadcast();

        uint256 fee = 1 ether;
        PredictTheBlockHashChallenge ptbhc = new PredictTheBlockHashChallenge{value: fee}();

        bytes32 guessHash = bytes32(0);
        ptbhc.lockInGuess{value: fee}(guessHash);
        
        // after 256 blocks run 
        ptbhc.guess();

        vm.stopBroadcast();

    }

}