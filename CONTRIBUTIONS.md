# 🧱 Public Solidity Contributions – Dozgor (IA-assisted Solidity Contributor)

This document summarizes my open-source contributions as part of my journey to become a professional Solidity developer.  
All projects were built using a rigorously guided AI-assisted methodology and demonstrate real-world skills applicable to freelance and team work.

## 🔗 GitHub Profile: [github.com/Dozgor](https://github.com/Dozgor)

---

## ✅ Contribution 1: OpenZeppelin Contracts – Invalid Beacon Test

- **PR**: [#5700 – openzeppelin/openzeppelin-contracts](https://github.com/OpenZeppelin/openzeppelin-contracts/pull/5700)
- **Date**: May 27, 2025

**Context**:  
Simulated an edge-case failure using an invalid beacon (`BadBeacon.sol`)  
Added a dedicated test in `BeaconProxy.test.js` to verify correct system behavior.

**Highlights**:
- Crafted a custom Solidity test contract
- Integrated seamlessly into a large test suite
- Resolved technical issues with Husky, Ethers, and local compilation
- Collaborated with the repo maintainers using IA-guided analysis

---

## ✅ Contribution 2: SimpleVault – Minimal Ether Vault Contract

- **Project**: [SimpleVault](./SimpleVault/README.md)
- **Date**: June 7, 2025

**Context**:  
Basic contract allowing a single owner to securely deposit and withdraw ETH.  
Used to demonstrate the correct usage of `msg.sender`, `msg.value`, `require`, and `transfer`.

**Highlights**:
- Minimal and clear code, tested in Remix
- `onlyOwner` modifier for secured withdrawals
- Public function to read contract balance
- Fully documented as a pedagogical base

---

## ✅ Contribution 3: UserRegistry – On-chain User Management

- **Project**: [UserRegistry](./user-registry/README.md)
- **Date**: May 30, 2025

**Context**:  
A contract allowing users to register themselves with a name, email, and timestamp.  
Useful for learning about mappings, structs, events, and input constraints.

**Highlights**:
- Mapping `address => User` with uniqueness checks
- Prevents double registration
- Emits events on registration
- Great for Web3 form/backend prototypes

---

## ✅ Contribution 4: SimpleDAO – Voting-Based DAO Prototype

- **Project**: [SimpleDAO](./Simple-DAO/README.md)
- **Date**: June 2, 2025

**Context**:  
A basic DAO structure where members can create proposals, vote, and trigger execution.  
Created to understand governance patterns and collective decision-making on-chain.

**Highlights**:
- Member-based voting system with proposal lifecycle
- Threshold and quorum logic
- Shows DAO patterns in a simplified, readable format

---

## ✅ Contribution 5: MiniMultiSigWallet – Lightweight Multisig Wallet

- **Project**: [MiniMultiSigWallet](./MiniMultiSigWallet/README.md)
- **Date**: June 4, 2025

**Context**:  
A minimal multi-signature wallet that requires multiple approvals to execute a transaction.  
Implemented and tested using Hardhat.

**Highlights**:
- Owners can submit, approve, and execute transactions
- Approval logic with threshold enforcement
- Uses nested mappings and structs
- Documented for reuse and audit training

---

## ✅ Contribution 6: MyERC20Token – Minimal ERC20 Token with Extensions

- **Project**: [MyERC20Token](./MyERC20Token/README.md)
- **Date**: May 29, 2025

**Context**:  
Custom ERC20 token based on OpenZeppelin’s implementation.  
Includes a `burn()` function and tested via Hardhat.

**Highlights**:
- Clean ERC20 base using OpenZeppelin Contracts
- Custom `burn(uint256)` function with `msg.sender` and `totalSupply` logic
- Unit tests covering mint, burn, and transfers
- Ready-to-fork and clearly documented

## ✅ Contribution 7: OpenZeppelin Contracts – ERC165 Invalid ID Test

PR: #1 – openzeppelin/openzeppelin-contracts
Date: June 22, 2025
Context:
Added a unit test in ERC165Checker.test.js to validate that the function supportsInterface returns false when provided with the reserved EIP-165 interface ID 0xffffffff.

Highlights:

Reinforced EIP-165 compliance with a boundary test

Aligned with standard testing practices in OpenZeppelin

Wrote, documented, and submitted PR directly through GitHub UI

Awaiting feedback from OpenZeppelin maintainers (actively monitored)

Demonstrates ability to contribute to production-grade Solidity codebases

---

## 🔜 Coming Up

- Final deployment of a feature-complete ERC20 with `mint`, `burn`, `approve`, and `transferFrom`
- Public contributions in gas optimization and security audits
- Solidity teaching materials (tested contracts, use-cases, common pitfalls)

---

## 🎯 Freelance-Ready Skills Highlight

- Writing and testing smart contracts using Hardhat, Remix, and Foundry  
- Contributing to large codebases (OpenZeppelin, community projects)  
- Creating clean, readable, and documented code for reuse and audits  
- Communicating clearly via Pull Requests and collaborative Git workflows  
- Available for missions involving auditing, test writing, smart contract development, and Solidity pedagogy

## 📬 Contact: dozgor.dev@proton.me

📅 **Last updated**: June 22, 2025  
✍️ **Signed**: Dozgor.dev  
