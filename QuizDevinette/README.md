# QuizDevinette.sol 🎯

An educational Solidity smart contract designed to demonstrate secure string comparison, access control, and event emission in a fun way.

## 📚 Description

**QuizDevinette** allows the contract owner to pose a riddle or a quiz question to users. The answer is stored as a hashed value, ensuring it cannot be guessed by simply inspecting the blockchain. Users can try to answer, and if correct, an event is emitted with their address.

This contract is intentionally minimal to illustrate the following Solidity concepts:
- `keccak256` hashing for secure comparison
- Access control via `owner` and `require`
- Events (`emit`) to notify success
- Simple string handling and encoding

## 🛠️ Features

- Only the owner can set a question and answer.
- The answer is stored as a hash (`keccak256`), not in plain text.
- Anyone can attempt to guess.
- Emits `ReponseTrouvee(address)` when a correct answer is given.

## 📦 Contract Functions

### `constructor()`
Sets the contract deployer as the owner.

### `poserDevinette(string _question, string _reponseClaire)`
Sets the question and stores the hashed answer (only callable by the owner).

### `deviner(string proposition)`
Allows anyone to guess the answer. If correct, emits an event.

## ✏️ Example Usage

```solidity
quiz.poserDevinette("What walks on four legs in the morning...", "man");
quiz.deviner("dog"); // ❌
quiz.deviner("man"); // ✅ emits ReponseTrouvee(msg.sender)
```

## 🔐 Security Notes
The answer is hashed using keccak256, but if the question is too obvious, someone might brute-force likely answers.

This contract does not include a reward mechanism or guess limits (for simplicity).

## 🧠 Learning Goals

This contract was created as part of my IA-assisted open-source Solidity learning journey. It demonstrates:

How to securely store and compare strings

Solidity basic control flows (if, require)

Structuring a beginner-friendly smart contract

🔗 Part of the ia-solidity-contributions project.
