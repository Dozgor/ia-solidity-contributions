// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import "forge-std/Test.sol";
import "../src/TimeLockedWallet.sol";

contract TimeLockedWalletTest is Test {
    TimeLockedWallet wallet;
    address owner;
    uint256 unlockTime;

    function setUp() public {
        owner = address(this); // le test est le propriétaire
        unlockTime = block.timestamp + 1 days;
        wallet = new TimeLockedWallet{value: 1 ether}(unlockTime);
    }

    function testWithdrawAfterUnlock() public {
        // On avance le temps
        vm.warp(unlockTime + 1);

        uint256 balanceBefore = owner.balance;
        wallet.withdraw();
        uint256 balanceAfter = owner.balance;

        assertGt(balanceAfter, balanceBefore, "Owner should have received the funds");
    }

    function testCannotWithdrawBeforeUnlock() public {
        vm.expectRevert("Funds are still locked");
        wallet.withdraw();
    }

    function testCannotWithdrawIfNotOwner() public {
        vm.warp(unlockTime + 1);

        address attacker = address(0xBEEF);
        vm.prank(attacker);
        vm.expectRevert("Not the owner");
        wallet.withdraw();
    }

    function testCannotDeployWithoutETH() public {
        vm.expectRevert("Must send ETH to lock");
        new TimeLockedWallet{value: 0}(unlockTime);
    }

    function testReceiveETH() public {
        payable(address(wallet)).transfer(1 ether);
        assertEq(address(wallet).balance, 2 ether);
    }

    receive() external payable {}
}