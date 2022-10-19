const { ethers,upgrades  } = require('hardhat')
// const { upgrades } = require('@openzeppelin/hardhat-upgrades')

async function main() {
 

  const Contract = await ethers.getContractFactory("Invest");
  const Invest = await upgrades.deployProxy(Contract);
  await Invest.deployed();
  console.log("Invest contract deployed to local node: "+ Invest.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
//Contract deployed at: 0x9fE46736679d2D9a65F0992F2272dE9f3c7fa6e0