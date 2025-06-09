# SimpleVault - Solidity Smart Contract

A minimal and educational smart contract to deposit and withdraw Ether securely.  
Written in Solidity ^0.8.0.

## 🧠 Features

- Owner-restricted withdrawals
- Ether deposits using `msg.value`
- Reverts on invalid withdrawal attempts
- Public balance query

## 📜 Smart Contract

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleVault {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    function deposit() public payable {
        require(msg.value > 0, "You must send ether");
    }

    function withdraw(uint _amount) public onlyOwner {
        require(_amount <= address(this).balance, "Not enough balance");
        payable(msg.sender).transfer(_amount);
    }
```

## ✅ Tests

Ce contrat a été testé avec Hardhat.

- ✔️ `deposit()` : accepte les fonds de l'utilisateur
- ✔️ `withdraw()` : permet à l'utilisateur de retirer ses fonds
- Tous les tests passent (`npx hardhat test`)

```bash
SimpleVault
  ✔ should accept deposits
  ✔ should allow withdrawal

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}
```

## 🧪 Testing

You can deploy and test this contract directly in Remix IDE:

Deploy the contract

Call deposit() with a value (e.g. 0.1 ETH)

Use getBalance() to verify

Call withdraw(amount) from the owner account

## 📂 Structure

SimpleVault.sol — Smart contract

README.md — Documentation

## 🔖 License

MIT License
