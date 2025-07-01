# TimeLockedWallet

This `TimeLockedWallet` contract allows locking ETH funds until a specific future date.  
It has been fully tested using Foundry.

---

## 📄 Description

The contract is deployed with a future **unlock time** (`unlockTime`).  
Any ETH sent during deployment is locked until that time.  
Only the **owner** can withdraw the funds once the date is reached.  
Additional ETH can be sent after deployment via the `receive()` function.

---

## 🧪 Tests (Foundry)

The automated tests cover:

- ✅ Deployment with or without ETH  
- ✅ Withdrawal blocked before the unlock time  
- ✅ Revert if a third party tries to withdraw  
- ✅ Receiving ETH after deployment  
- ✅ Successful withdrawal after unlock time

To run the tests:

```bash
forge test
```

## 📁 Files
File	Role
TimeLockedWallet.sol	Main contract
TimeLockedWallet.t.sol	Test file using Forge

## 🛠️ Potential Improvements
Emit a Withdrawn event upon withdrawal

Add a fallback() function with specific logic

Add an interface for broader contract compatibility

## ✍️ Author
Dozgor – github.com/Dozgor
