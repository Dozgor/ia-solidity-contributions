const { expect } = require("chai");
const hre = require("hardhat");
const { parseEther } = hre.ethers;
const ethers = hre.ethers;

describe("SimpleVault", function () {
  let Vault, vault, admin, addr1;

  beforeEach(async function () {
    [admin, addr1] = await ethers.getSigners();
    Vault = await ethers.getContractFactory("SimpleVault");
    vault = await Vault.deploy(); // bien attendre le déploiement
  });

  it("should allow admin to withdraw", async function () {
    // L'admin dépose 1 ETH via la fonction prévue
    await vault.connect(admin).deposit({ value: parseEther("1.0") });

    // Puis retire tout ce qu'il a déposé
    await expect(vault.connect(admin).withdraw())
      .to.changeEtherBalances(
        [vault, admin],
        [parseEther("-1.0"), parseEther("1.0")]
      );
  });

  it("should revert if non-admin tries to withdraw", async function () {
    // addr1 dépose 1 ETH (c’est autorisé)
    await vault.connect(addr1).deposit({ value: parseEther("1.0") });

    // addr1 tente de retirer, mais il n'est pas admin
    await expect(
      vault.connect(addr1).withdraw()
    ).to.be.revertedWith("Caller is not the admin!");
  });
});
