# 🔐 SimpleVault

A minimal Solidity smart contract that allows users to securely deposit and withdraw funds.  
Designed for learning, showcasing clean patterns, and demonstrating testing with Hardhat.

---

## 🧠 Features

- **Deposit Ether** into the vault with `deposit()`
- **Withdraw available balance** with `withdraw()`
- **Per-user balance tracking** with a public `balances` mapping

---

## ✅ Tests

This contract is fully tested using [Hardhat](https://hardhat.org).

```bash
SimpleVault
  ✔ should accept deposits
  ✔ should allow withdrawal
To run the tests locally:
npx hardhat test
```

## 📄 Contract Code

```bash
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

## 🧪 Technologies Used

Solidity ^0.8.20

Hardhat for development and testing

Chai + Ethers for assertions

## 🚀 Usage

Clone the repository

Navigate to the SimpleVault directory

Run:

```bash
npm install
npx hardhat test
```

## 🧑‍💻 About the Author

I'm Dozgor, a Solidity developer building clean, tested contracts using modern tooling and AI assistance.
This project is part of my freelance portfolio.
Feel free to reach out for smart contract development, testing, or auditing.

## 📧 Contact: dozgor.dev@proton.me

## 🌐 Portfolio: github.com/Dozgor
