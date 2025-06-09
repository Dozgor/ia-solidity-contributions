const { expect } = require("chai");
const { ethers } = require("hardhat");
const { parseEther } = ethers;

describe("SimpleVault", function () {
  let vault, owner, user;

  beforeEach(async function () {
    [owner, user] = await ethers.getSigners();
    const Vault = await ethers.getContractFactory("SimpleVault");
    vault = await Vault.deploy();
  });

  it("should accept deposits", async function () {
    await vault.connect(user).deposit({ value: parseEther("1") });
    const balance = await vault.balances(user.address);
    expect(balance).to.equal(parseEther("1"));
  });

  it("should allow withdrawal", async function () {
    await vault.connect(user).deposit({ value: parseEther("1") });
    await vault.connect(user).withdraw();
    const balance = await vault.balances(user.address);
    expect(balance).to.equal(0);
  });
});