#🧠 IA-Assisted Solidity Contributions
Bienvenue ! Je suis Dozgor, développeur Solidity, en transition vers le freelance Web3.

Ce dépôt regroupe mes contributions open source, mini-projets Solidity, tests automatisés (Foundry & Hardhat), et autres expérimentations réalisées avec l’aide d’une IA spécialisée (ChatGPT).

##🎯 Objectif
Créer des contrats sécurisés, lisibles et bien testés, grâce à :

-Mon expertise grandissante en Solidity

-L’assistance IA continue (aide au design, aux tests, à l’optimisation, etc.)

##🛠️ Outils utilisés
-Solidity

-Hardhat

-Foundry (Forge, Anvil, Cast, Chisel)

-Remix IDE

-ChatGPT (IA pour conseils, tests, refacto)

-Git + GitHub

##📁 Structure du dépôt
Dossier / Fichier	Description
TimeLockedWallet	Contrat verrouillant des fonds jusqu’à une date donnée (Foundry)
MiniMultiSigWallet	Contrat multisig simple (WIP)
MyERC20Token	Implémentation d’un token ERC20 de base
QuizDevinette	Jeu de devinettes Solidity avec test en JS
Simple-DAO	DAO basique avec système de proposition et vote
SimpleVault	Coffre sécurisé avec dépôt et retrait sur Hardhat
user-registry	Contrat d’enregistrement d’utilisateurs
docs/	Documentation additionnelle (CONTRIBUTIONS.md)
test/, script/, src/	Arborescence des projets Foundry
README.md, .gitignore, foundry.toml	Fichiers racine de configuration

##✅ Exemple de Contribution Open Source
Pull Request #5700 — OpenZeppelin Contracts

-Création de BadBeacon.sol pour simuler un beacon invalide

-Ajout d’un test automatisé dans BeaconProxy.test.js pour tester un mauvais comportement

##🔧 Usage Foundry
Installer et utiliser Foundry
Documentation officielle → Foundry Book

```bash
forge build           # Compilation
forge test            # Tests unitaires
forge fmt             # Formatage du code
forge snapshot        # Snapshot de gas
anvil                 # Lancer un node local
```
Déployer un contrat :

```bash
forge script script/Counter.s.sol:CounterScript \
  --rpc-url <your_rpc_url> \
  --private-key <your_private_key>
```

##🧭 Prochaines étapes
-📦 Créer une mini-lib Solidity réutilisable

-🧪 Ajouter des tests fuzzing et edge-cases

-🚀 Lancer des missions freelance courtes (audit, écriture, correction)

- Publier un mini ERC20 documenté

##📫 Contact
Je suis ouvert à toute mission freelance courte dans l’écosystème Ethereum/Web3.

👉 Contactez-moi via GitHub ou LinkedIn
