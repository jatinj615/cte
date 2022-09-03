pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../../src/warmup/NickName.sol";

contract MyScript is Script {

    function run() public {
        vm.startBroadcast();

        CaptureTheEther cte = new CaptureTheEther();

        cte.setNickname('0xjj615');
        
        vm.stopBroadcast();
    }
}