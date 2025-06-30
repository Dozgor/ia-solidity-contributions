## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
# IA-Assisted Solidity Contributions

Welcome! My name is Dozgor, and I'm a Solidity developer transitioning into Web3 freelance work.

This repository showcases my open-source contributions, Solidity experiments, and tests — all supported by specialized AI assistance.

## 🎯 Purpose
To deliver secure, readable, and well-tested smart contracts by combining:
- My growing expertise in Solidity
- Continuous collaboration with AI to guide, review, and enhance my work

## 🛠️ Tools Used
- Solidity
- Hardhat
- Remix
- ChatGPT (AI for code analysis, test writing, refactoring)
- Git + GitHub

## ✅ Example Contribution
- [PR #5700 – OpenZeppelin Contracts](https://github.com/OpenZeppelin/openzeppelin-contracts/pull/5700/commits/2bda29a50a2b2abfec3f40d197b08b076ab9ba88)  
  A custom `BadBeacon.sol` was created to simulate a faulty beacon. An automated test was added in `BeaconProxy.test.js` to verify proper behavior.

## 🧭 Next Steps
- Publish a documented mini ERC20 token
- Contribute to gas optimizations and security audits

## 📫 Contact
Open to short freelance missions and open-source contributions.  
Feel free to reach out!

– Dozgor
# IA-Assisted Solidity Contributions

Bienvenue ! Je suis Dozgor, développeur Solidity en transition vers le freelance Web3.

Ce dépôt regroupe mes contributions open source, expérimentations Solidity et tests réalisés avec l'assistance d'une IA spécialisée.

## 🎯 Objectif
Créer des contrats sécurisés, lisibles et bien testés grâce à l’alliance entre :
- mon expertise grandissante en Solidity,
- l’assistance continue d’une IA spécialisée.

## 🛠️ Outils utilisés
- Solidity
- Hardhat
- Remix
- ChatGPT (IA pour l’analyse de code, les tests, la rédaction)
- Git + GitHub

## ✅ Exemples de contributions
- [PR #5454 – OpenZeppelin Contracts](https://github.com/OpenZeppelin/openzeppelin-contracts/pull/5454)
- Contrat de test : `BadBeacon.sol`
- Test unitaire : `BeaconProxy.test.js`

## 🧭 Prochaines étapes
- Création de mini-libraries Solidity
- Optimisation et audits de gas
- Livraisons de missions freelance encadrées
