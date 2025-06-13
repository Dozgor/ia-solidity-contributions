# 🔐 SimpleVault – Contrat Solidity pédagogique

Ce dépôt contient un contrat Ethereum simple nommé `SimpleVault`, conçu pour illustrer les bases suivantes :
- le **stockage d'ether par utilisateur** (`deposit`)
- le **retrait sécurisé réservé à un administrateur** (`withdraw`)
- la **pause du contrat en cas de besoin**
- les **tests automatisés** avec Hardhat

---

## 🎯 Objectif du projet

> Offrir un exemple clair et sécurisé d’un coffre-fort minimal en Solidity avec contrôle d’accès et tests unitaires. Ce contrat est utilisé comme base pédagogique pour apprendre Solidity et développer une vitrine freelance Web3.

---

## 💡 Fonctionnalités principales

- `deposit()` : permet à tout utilisateur de déposer des fonds dans le coffre (stockés par adresse)
- `withdraw()` : permet à l’**admin uniquement** de retirer les fonds qu’il a déposés
- `pause()` / `unpause()` : activables par l’admin, empêchent les dépôts et retraits
- `receive()` : permet de recevoir de l’ETH directement
- Modificateurs `onlyAdmin` et `whenNotPaused`

---

## 🧪 Tests automatisés (Hardhat + Chai)

Les tests valident les comportements suivants :
- ✅ L'admin peut déposer et retirer ses fonds
- ❌ Un non-admin ne peut pas appeler `withdraw`
- (Bonus possible) ❌ Le contrat en pause rejette les appels

```bash
npx hardhat test
```

## 👨‍💻 Ce que ce projet démontre

Structuration propre d’un contrat Solidity simple

Bonnes pratiques de sécurité (require, modifiers, séparation des rôles)

Maitrise de Hardhat et des tests unitaires

Démarche "IA-assisted Solidity contributor" (Dozgor)

## 📂 Structure

```bash
contracts/
  └── SimpleVault.sol
test/
  └── SimpleVault.test.js
```

## 🤝 Licence

MIT — libre d’usage, de copie, de modification et de partage.

## 👨‍🔧 Réalisé par Dozgor, développeur Solidity guidé par l’IA pour accélérer l’apprentissage et garantir la qualité.
