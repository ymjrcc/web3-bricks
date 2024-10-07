//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "../contracts/MultiSigWallet.sol";
import "../contracts/MerkleAirdropToken.sol";
import "../contracts/MerkleAirdrop.sol";
import "../contracts/CFToken.sol";
import "../contracts/CrowdFund.sol";
import "../contracts/DutchAuction.sol";
import { YMNFT } from "../contracts/YMNFT.sol";
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


    // ===== MultiSigWallet Script Start =====
    // address[] memory owners = new address[](3);
    // owners[0] = 0xCE733Fa2f9dd9Aee9353248fB0F237b0522af73E;
    // owners[1] = 0xFA8Bac84bb8594B7Fc7ACAF932cA680D9A6E495E;
    // owners[2] = 0xDD73b74016a3Ca58765f932b0104126948c5D46A;
    // MultiSigWallet wallet = new MultiSigWallet(owners,2);
    // console.logString(
    //   string.concat(
    //     "MultiSigWallet deployed at: ", vm.toString(address(wallet))
    //   )
    // );
    // ===== MultiSigWallet Script Stop =====

    // ===== MerkleAirdrop Script Start =====
    // MerkleAirdropToken merkleAirdropToken = new MerkleAirdropToken(
    //   0xFA8Bac84bb8594B7Fc7ACAF932cA680D9A6E495E
    // );
    // MerkleAirdrop merkleAirdrop = new MerkleAirdrop(
    //   address(merkleAirdropToken), // token address
    //   0x26fae51b60a8e480925a41bc9076e8661aa986919d77f5e1459cb5c699b9adfc // merkle root
    // );
    // console.logString(
    //   string.concat(
    //     "MerkleAirdropToken deployed at: ", vm.toString(address(merkleAirdropToken))
    //   )
    // );
    // console.logString(
    //   string.concat(
    //     "merkleAirdrop deployed at: ", vm.toString(address(merkleAirdrop))
    //   )
    // );
    // ===== MerkleAirdrop Script Stop =====

    // ===== CrowdFund Script Start =====
    // CFToken cfToken = new CFToken(0xFA8Bac84bb8594B7Fc7ACAF932cA680D9A6E495E);
    // CrowdFund crowdFund = new CrowdFund(address(cfToken));
    // console.logString(
    //   string.concat(
    //     "CFToken deployed at: ", vm.toString(address(cfToken))
    //   )
    // );
    // console.logString(
    //   string.concat(
    //     "CrowdFund deployed at: ", vm.toString(address(crowdFund))
    //   )
    // );
    // ===== CrowdFund Script Stop =====

    // ===== DutchAuction Script Start =====
    DutchAuction dutchAuction = new DutchAuction();
    console.logString(
      string.concat(
        "DutchAuction deployed at: ", vm.toString(address(dutchAuction))
      )
    );
    YMNFT ymnft = new YMNFT(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266);
    console.logString(
      string.concat(
        "YMNFT deployed at: ", vm.toString(address(ymnft))
      )
    );
    // ===== DutchAuction Script Stop =====

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
