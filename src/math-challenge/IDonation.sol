pragma solidity ^0.8.0;

interface IDonationChallenge {

    function donate(uint256 etherAmount) external payable;

    function withdraw() external;
}