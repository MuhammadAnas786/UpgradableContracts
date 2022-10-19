require("@nomicfoundation/hardhat-toolbox");
require('@nomiclabs/hardhat-ethers');
require('@openzeppelin/hardhat-upgrades');

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.2",
  networks:{
    fuji:{
      url:'https://api.avax-test.network/ext/bc/C/rpc',
      accounts:[process.env.PRIVATE_KEY],
      
    },
  },
  etherscan: {
    apiKey: {
      avalancheFujiTestnet: `${process.env.EXPLORER_API_KEY}`
    }
  }
};
