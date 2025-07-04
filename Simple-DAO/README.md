# SimpleDAO

A lightweight, secure and minimal DAO smart contract for managing shared ETH funds by collective approval.

Built by Dozgor as part of a Solidity learning and freelance portfolio.

---

## 🔍 Overview

This contract allows a group of members to:

- Propose a payment (recipient + amount)
- Approve the proposal (1 vote per member)
- Execute it once a majority is reached

###Use cases:
- Shared wallet between multiple contributors
- Micro-DAO for managing a project treasury
- Co-approval for collective payments

---

## 🧱 Core Features

| Function                | Description                                      |
|------------------------|--------------------------------------------------|
| `submitProposal()`     | A member proposes a payment                     |
| `approveProposal()`    | A member approves a proposal                    |
| `getApprovalCount()`   | View current approval count                     |
| `executeProposal()`    | Sends ETH to recipient if enough approvals      |

---

## ⚙️ Constructor

```solidity
constructor(address[] memory _members, uint _requiredApprovals)
```

_members: list of DAO participants

_requiredApprovals: number of approvals needed to execute proposals

Example: SimpleDAO([addr1, addr2, addr3, addr4, addr5], 3) requires 3 out of 5 votes.

## 🔐 Modifiers Used

onlyMember: only DAO members can interact

proposalExists: protects against invalid index

notExecuted: prevents double execution

## 🧪 How to Test in Remix

Deploy with at least 2 addresses and requiredApprovals

Send ETH to the contract via Remix (Deploy tab > Value > "Transact")

Use submitProposal to propose a payment

Approve from different member accounts

Execute the proposal once the threshold is met

## 💸 Example Proposal

submitProposal(payable(0x123...), 1 ether)

## 📜 License

MIT

## 👤 Author

Dozgor
Solidity Developer – Learning through building.
GitHub Profile
