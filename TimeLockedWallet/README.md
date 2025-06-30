# TimeLockedWallet

Ce contrat `TimeLockedWallet` permet de verrouiller des fonds en ETH jusqu’à une date donnée. Il a été entièrement testé avec **Foundry**.

## 📄 Description

- Le contrat est déployé avec une date de déverrouillage (`unlockTime`) future.
- L’ETH envoyé lors du déploiement est bloqué jusqu’à cette date.
- Seul le propriétaire peut retirer les fonds une fois la date atteinte.
- Des ETH supplémentaires peuvent être envoyés après le déploiement via `receive()`.

## 🧪 Tests (Foundry)

Les tests automatisés couvrent :

- ✅ Déploiement avec ou sans ETH
- ✅ Blocage des retraits avant la date
- ✅ Rejet si un tiers tente un retrait
- ✅ Réception d’ETH après déploiement
- ✅ Retrait réussi après le `unlockTime`

Lancer les tests :
```bash
forge test
```
## 📁 Fichiers
| Fichier                  | Rôle                       |
| ------------------------ | -------------------------- |
| `TimeLockedWallet.sol`   | Contrat principal          |
| `TimeLockedWallet.t.sol` | Fichier de test avec Forge |

## 🛠️ Améliorations possibles
Événement Withdrawn à émettre lors du retrait

Ajout d’un fallback function avec gestion spécifique

Interface pour compatibilité avec d’autres contrats

## ✍️ Auteur
Dozgor – github.com/Dozgor
