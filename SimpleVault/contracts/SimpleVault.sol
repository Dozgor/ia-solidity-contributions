// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleVault {
    mapping(address => uint256) public balances;
    address public admin;
    bool public paused = false;
    receive() external payable {}
    constructor(){
        admin = msg.sender;
    }

    modifier whenNotPaused() {
    require(!paused, "Contrat en pause");
    _;
    }

    modifier onlyAdmin(){
        require(msg.sender == admin,"Caller is not the admin!");
        _;
    }

    function pause() public onlyAdmin {
    paused = true;
    }

    function unpause() public onlyAdmin {
    paused = false;
    }

    function deposit() external payable whenNotPaused{
        balances[msg.sender] += msg.value;
    }

    function withdraw() external whenNotPaused onlyAdmin{
        uint256 amount = balances[msg.sender];
        require(amount > 0, "Nothing to withdraw");

        balances[msg.sender] = 0;
        payable(msg.sender).transfer(amount);
    }
}
