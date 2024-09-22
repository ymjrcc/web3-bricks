//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
import "../contracts/MultiSigWallet.sol";
import "./DeployHelpers.s.sol";

contract DeployScript is ScaffoldETHDeploy {
  error InvalidPrivateKey(string);

  function run() external {
    uint256 deployerPrivateKey = setupLocalhostEnv();
    if (deployerPrivateKey == 0) {
      revert InvalidPrivateKey(
        "You don't have a deployer account. Make sure you have set DEPLOYER_PRIVATE_KEY in .env or use `yarn generate` to generate a new random account"
      );
    }
    vm.startBroadcast(deployerPrivateKey);

    address[] memory owners = new address[](3);
    // owners[0] = 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266;
    // owners[1] = 0x70997970C51812dc3A010C7d01b50e0d17dc79C8;
    // owners[2] = 0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC;
    owners[0] = 0xCE733Fa2f9dd9Aee9353248fB0F237b0522af73E;
    owners[1] = 0xFA8Bac84bb8594B7Fc7ACAF932cA680D9A6E495E;
    owners[2] = 0xDD73b74016a3Ca58765f932b0104126948c5D46A;
    MultiSigWallet wallet = new MultiSigWallet(owners,2);
    console.logString(
      string.concat(
        "MultiSigWallet deployed at: ", vm.toString(address(wallet))
      )
    );

    vm.stopBroadcast();

    /**
     * This function generates the file containing the contracts Abi definitions.
     * These definitions are used to derive the types needed in the custom scaffold-eth hooks, for example.
     * This function should be called last.
     */
    exportDeployments();
  }

  function test() public { }
}
