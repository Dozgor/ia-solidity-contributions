# MiniMultiSigWallet

A minimal and secure multi-signature wallet written in Solidity.  
Allows multiple owners to manage shared funds with a configurable approval threshold.

## 🔒 Features

- Multiple owners with equal rights
- Transaction submission by any owner
- Per-owner approval system
- Minimum approvals required before execution
- Safe `executeTransaction` logic with verification
- Custom `modifiers` to simplify logic (`onlyOwner`, `txExists`, `notExecuted`)

## ⚙️ Constructor

```solidity
constructor(address[] memory _owners, uint _requiredApprovals)
```
_owners: Array of wallet owners
_requiredApprovals: Minimum number of approvals required to execute a transaction

## 📦 Core Functions

Function	Description

submitTransaction(address to, uint256 value, bytes calldata data)	Propose a new transaction

approveTransaction(uint txIndex)	Approve a transaction (once per owner)

getApprovalCount(uint txIndex)	Get number of approvals for a transaction

executeTransaction(uint txIndex)	Executes the transaction if enough approvals

## 📌 Example usage (Remix)

```solidity
// Step 1: Submit a transaction
submitTransaction(0xAbC123..., 1 ether, "0x");

// Step 2: Approve it from 2 different owner accounts
approveTransaction(0);
approveTransaction(0);

// Step 3: Execute once threshold is reached
executeTransaction(0);
```

## 🛡️ Security

Only registered owners can submit/approve/execute

Each transaction can only be executed once

modifiers prevent invalid calls:

onlyOwner: restrict access to owners

txExists: prevent out-of-bounds access

notExecuted: avoid re-execution

## 🧪 Testing (Remix)

Deploy contract with multiple accounts and required approvals

submitTransaction with account 1

approveTransaction with account 2 and 3

executeTransaction once approvals threshold is met

## 📁 File

MiniMultiSigWallet.sol

## 📜 License

MIT

## 🧠 Author

Built by Dozgor, as part of a Solidity/Web3 learning journey.
This project serves as a public proof of understanding and freelance readiness.
