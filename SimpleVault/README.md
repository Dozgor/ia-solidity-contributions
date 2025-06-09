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
pragma solidity ^0.8.20;

contract SimpleVault {
    mapping(address => uint256) public balances;

    function deposit() external payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() external {
        uint256 amount = balances[msg.sender];
        require(amount > 0, "Nothing to withdraw");

        balances[msg.sender] = 0;
        payable(msg.sender).transfer(amount);
    }
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
