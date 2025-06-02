# 🧾 UserRegistry.sol

This Solidity smart contract demonstrates the use of `struct`, `mapping`, and basic `view` and `write` functions.  
It allows users to register a profile and retrieve user data based on Ethereum addresses.

---

## ✨ Features

- Define a custom `User` struct
- Store user data using a `mapping(address => User)`
- Register user data from `msg.sender`
- Read user information from any given address
- Clean and gas-efficient code with `calldata` and `memory`

---

## 📦 Contract Overview

```solidity
struct User {
    string name;
    address useraddress;
    uint age;
}

mapping(address => User) public users;

function registerUser(string calldata name, uint age) public;
function getUser(address userAddr) public view returns (string memory, address, uint);
```

## 🚀 Usage (with Remix or Hardhat)

Deploy the contract

Call registerUser("Dozgor", 33) from any address

Retrieve your profile:

Via users[msg.sender]

Or call getUser(address)

## ✅ Example

```solidity

registerUser("Alice", 30);
getUser(0xABC...); // returns ("Alice", 0xABC..., 30)
```

## 🧠 Concepts covered

struct for custom data types

mapping for address-based storage

msg.sender to identify callers

calldata for input efficiency

memory for temporary access

view functions for read-only access

## 📁 File

UserRegistry.sol — main contract file

## 👨‍💻 Author

Dozgor — IA-assisted Solidity Contributor
Part of the ia-solidity-contributions collection.
