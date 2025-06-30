// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/// @title TimeLockedWallet
/// @author Dozgor
/// @notice Ce contrat reçoit de l'ETH et le garde verrouillé jusqu'à une date précise
contract TimeLockedWallet {
    address public immutable owner;
    uint256 public immutable unlockTime;

    constructor(uint256 _unlockTime) payable {
        require(_unlockTime > block.timestamp, "Unlock time must be in the future");
        require(msg.value > 0, "Must send ETH to lock");

        owner = msg.sender;
        unlockTime = _unlockTime;
    }

    /// @notice Retirer les fonds une fois le temps écoulé
    function withdraw() external {
        require(msg.sender == owner, "Not the owner");
        require(block.timestamp >= unlockTime, "Funds are still locked");

        uint256 amount = address(this).balance;
        payable(owner).transfer(amount);
    }

    /// @notice Recevoir de l'ETH additionnel (optionnel)
    receive() external payable {}
}
