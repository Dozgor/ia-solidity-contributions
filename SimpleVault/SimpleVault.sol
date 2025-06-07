// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleVault {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(owner == msg.sender, "Not the owner");
        _;
    }

    // Dépôt : envoie d'ether avec l'appel
    function deposit() public payable {
        require(msg.value > 0, "You must send some ether");
    }

    // Retrait : l'utilisateur peut retirer une somme précise
    function withdraw(uint _amount) external onlyOwner {
        require(_amount <= address(this).balance, "Insufficient balance in vault");
        payable(msg.sender).transfer(_amount);
    }

    // Lire le solde du contrat
    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
    function getBalanceOwner() external view returns (uint) {
        return owner.balance;
    }
}