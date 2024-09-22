/**
 * This file is autogenerated by Scaffold-ETH.
 * You should not edit it manually or your changes might be overwritten.
 */
import { GenericContractsDeclaration } from "~~/utils/scaffold-eth/contract";

const deployedContracts = {
  31337: {
    MultiSigWallet: {
      address: "0xe7f1725e7734ce288f8367e1bb143e90bb3f0512",
      abi: [
        {
          type: "constructor",
          inputs: [
            {
              name: "_owners",
              type: "address[]",
              internalType: "address[]",
            },
            {
              name: "_ownersCountForConfirmation",
              type: "uint128",
              internalType: "uint128",
            },
          ],
          stateMutability: "nonpayable",
        },
        {
          type: "receive",
          stateMutability: "payable",
        },
        {
          type: "function",
          name: "confirmTransaction",
          inputs: [
            {
              name: "_txIndex",
              type: "uint256",
              internalType: "uint256",
            },
          ],
          outputs: [],
          stateMutability: "nonpayable",
        },
        {
          type: "function",
          name: "executeTransaction",
          inputs: [
            {
              name: "_txIndex",
              type: "uint256",
              internalType: "uint256",
            },
          ],
          outputs: [],
          stateMutability: "nonpayable",
        },
        {
          type: "function",
          name: "getOwners",
          inputs: [],
          outputs: [
            {
              name: "",
              type: "address[]",
              internalType: "address[]",
            },
          ],
          stateMutability: "view",
        },
        {
          type: "function",
          name: "getTransactions",
          inputs: [],
          outputs: [
            {
              name: "",
              type: "tuple[]",
              internalType: "struct MultiSigWallet.Transaction[]",
              components: [
                {
                  name: "executed",
                  type: "bool",
                  internalType: "bool",
                },
                {
                  name: "confirmations",
                  type: "uint128",
                  internalType: "uint128",
                },
                {
                  name: "destination",
                  type: "address",
                  internalType: "address",
                },
                {
                  name: "value",
                  type: "uint256",
                  internalType: "uint256",
                },
                {
                  name: "data",
                  type: "bytes",
                  internalType: "bytes",
                },
              ],
            },
          ],
          stateMutability: "view",
        },
        {
          type: "function",
          name: "isConfirmed",
          inputs: [
            {
              name: "",
              type: "uint256",
              internalType: "uint256",
            },
            {
              name: "",
              type: "address",
              internalType: "address",
            },
          ],
          outputs: [
            {
              name: "",
              type: "bool",
              internalType: "bool",
            },
          ],
          stateMutability: "view",
        },
        {
          type: "function",
          name: "isOwner",
          inputs: [
            {
              name: "",
              type: "address",
              internalType: "address",
            },
          ],
          outputs: [
            {
              name: "",
              type: "bool",
              internalType: "bool",
            },
          ],
          stateMutability: "view",
        },
        {
          type: "function",
          name: "owners",
          inputs: [
            {
              name: "",
              type: "uint256",
              internalType: "uint256",
            },
          ],
          outputs: [
            {
              name: "",
              type: "address",
              internalType: "address",
            },
          ],
          stateMutability: "view",
        },
        {
          type: "function",
          name: "ownersCountForConfirmation",
          inputs: [],
          outputs: [
            {
              name: "",
              type: "uint128",
              internalType: "uint128",
            },
          ],
          stateMutability: "view",
        },
        {
          type: "function",
          name: "submitTransaction",
          inputs: [
            {
              name: "_destination",
              type: "address",
              internalType: "address",
            },
            {
              name: "_value",
              type: "uint256",
              internalType: "uint256",
            },
            {
              name: "_data",
              type: "bytes",
              internalType: "bytes",
            },
          ],
          outputs: [],
          stateMutability: "nonpayable",
        },
        {
          type: "function",
          name: "transactions",
          inputs: [
            {
              name: "",
              type: "uint256",
              internalType: "uint256",
            },
          ],
          outputs: [
            {
              name: "executed",
              type: "bool",
              internalType: "bool",
            },
            {
              name: "confirmations",
              type: "uint128",
              internalType: "uint128",
            },
            {
              name: "destination",
              type: "address",
              internalType: "address",
            },
            {
              name: "value",
              type: "uint256",
              internalType: "uint256",
            },
            {
              name: "data",
              type: "bytes",
              internalType: "bytes",
            },
          ],
          stateMutability: "view",
        },
        {
          type: "function",
          name: "withdraw",
          inputs: [],
          outputs: [],
          stateMutability: "nonpayable",
        },
        {
          type: "event",
          name: "Deposit",
          inputs: [
            {
              name: "sender",
              type: "address",
              indexed: true,
              internalType: "address",
            },
            {
              name: "value",
              type: "uint256",
              indexed: false,
              internalType: "uint256",
            },
          ],
          anonymous: false,
        },
        {
          type: "event",
          name: "TransactionConfirmed",
          inputs: [
            {
              name: "txIndex",
              type: "uint256",
              indexed: true,
              internalType: "uint256",
            },
            {
              name: "owner",
              type: "address",
              indexed: true,
              internalType: "address",
            },
          ],
          anonymous: false,
        },
        {
          type: "event",
          name: "TransactionExecuted",
          inputs: [
            {
              name: "txIndex",
              type: "uint256",
              indexed: true,
              internalType: "uint256",
            },
          ],
          anonymous: false,
        },
        {
          type: "event",
          name: "TransactionSubmitted",
          inputs: [
            {
              name: "txIndex",
              type: "uint256",
              indexed: true,
              internalType: "uint256",
            },
            {
              name: "owner",
              type: "address",
              indexed: true,
              internalType: "address",
            },
            {
              name: "destination",
              type: "address",
              indexed: true,
              internalType: "address",
            },
            {
              name: "value",
              type: "uint256",
              indexed: false,
              internalType: "uint256",
            },
            {
              name: "data",
              type: "bytes",
              indexed: false,
              internalType: "bytes",
            },
          ],
          anonymous: false,
        },
      ],
      inheritedFunctions: {},
    },
  },
  11155111: {
    MultiSigWallet: {
      address: "0xf5fba73acabe9267bc406364ce0d3af4dc13fe31",
      abi: [
        {
          type: "constructor",
          inputs: [
            {
              name: "_owners",
              type: "address[]",
              internalType: "address[]",
            },
            {
              name: "_ownersCountForConfirmation",
              type: "uint128",
              internalType: "uint128",
            },
          ],
          stateMutability: "nonpayable",
        },
        {
          type: "receive",
          stateMutability: "payable",
        },
        {
          type: "function",
          name: "confirmTransaction",
          inputs: [
            {
              name: "_txIndex",
              type: "uint256",
              internalType: "uint256",
            },
          ],
          outputs: [],
          stateMutability: "nonpayable",
        },
        {
          type: "function",
          name: "executeTransaction",
          inputs: [
            {
              name: "_txIndex",
              type: "uint256",
              internalType: "uint256",
            },
          ],
          outputs: [],
          stateMutability: "nonpayable",
        },
        {
          type: "function",
          name: "getOwners",
          inputs: [],
          outputs: [
            {
              name: "",
              type: "address[]",
              internalType: "address[]",
            },
          ],
          stateMutability: "view",
        },
        {
          type: "function",
          name: "getTransactions",
          inputs: [],
          outputs: [
            {
              name: "",
              type: "tuple[]",
              internalType: "struct MultiSigWallet.Transaction[]",
              components: [
                {
                  name: "executed",
                  type: "bool",
                  internalType: "bool",
                },
                {
                  name: "confirmations",
                  type: "uint128",
                  internalType: "uint128",
                },
                {
                  name: "destination",
                  type: "address",
                  internalType: "address",
                },
                {
                  name: "value",
                  type: "uint256",
                  internalType: "uint256",
                },
                {
                  name: "data",
                  type: "bytes",
                  internalType: "bytes",
                },
              ],
            },
          ],
          stateMutability: "view",
        },
        {
          type: "function",
          name: "isConfirmed",
          inputs: [
            {
              name: "",
              type: "uint256",
              internalType: "uint256",
            },
            {
              name: "",
              type: "address",
              internalType: "address",
            },
          ],
          outputs: [
            {
              name: "",
              type: "bool",
              internalType: "bool",
            },
          ],
          stateMutability: "view",
        },
        {
          type: "function",
          name: "isOwner",
          inputs: [
            {
              name: "",
              type: "address",
              internalType: "address",
            },
          ],
          outputs: [
            {
              name: "",
              type: "bool",
              internalType: "bool",
            },
          ],
          stateMutability: "view",
        },
        {
          type: "function",
          name: "owners",
          inputs: [
            {
              name: "",
              type: "uint256",
              internalType: "uint256",
            },
          ],
          outputs: [
            {
              name: "",
              type: "address",
              internalType: "address",
            },
          ],
          stateMutability: "view",
        },
        {
          type: "function",
          name: "ownersCountForConfirmation",
          inputs: [],
          outputs: [
            {
              name: "",
              type: "uint128",
              internalType: "uint128",
            },
          ],
          stateMutability: "view",
        },
        {
          type: "function",
          name: "submitTransaction",
          inputs: [
            {
              name: "_destination",
              type: "address",
              internalType: "address",
            },
            {
              name: "_value",
              type: "uint256",
              internalType: "uint256",
            },
            {
              name: "_data",
              type: "bytes",
              internalType: "bytes",
            },
          ],
          outputs: [],
          stateMutability: "nonpayable",
        },
        {
          type: "function",
          name: "transactions",
          inputs: [
            {
              name: "",
              type: "uint256",
              internalType: "uint256",
            },
          ],
          outputs: [
            {
              name: "executed",
              type: "bool",
              internalType: "bool",
            },
            {
              name: "confirmations",
              type: "uint128",
              internalType: "uint128",
            },
            {
              name: "destination",
              type: "address",
              internalType: "address",
            },
            {
              name: "value",
              type: "uint256",
              internalType: "uint256",
            },
            {
              name: "data",
              type: "bytes",
              internalType: "bytes",
            },
          ],
          stateMutability: "view",
        },
        {
          type: "function",
          name: "withdraw",
          inputs: [],
          outputs: [],
          stateMutability: "nonpayable",
        },
        {
          type: "event",
          name: "Deposit",
          inputs: [
            {
              name: "sender",
              type: "address",
              indexed: true,
              internalType: "address",
            },
            {
              name: "value",
              type: "uint256",
              indexed: false,
              internalType: "uint256",
            },
          ],
          anonymous: false,
        },
        {
          type: "event",
          name: "TransactionConfirmed",
          inputs: [
            {
              name: "txIndex",
              type: "uint256",
              indexed: true,
              internalType: "uint256",
            },
            {
              name: "owner",
              type: "address",
              indexed: true,
              internalType: "address",
            },
          ],
          anonymous: false,
        },
        {
          type: "event",
          name: "TransactionExecuted",
          inputs: [
            {
              name: "txIndex",
              type: "uint256",
              indexed: true,
              internalType: "uint256",
            },
          ],
          anonymous: false,
        },
        {
          type: "event",
          name: "TransactionSubmitted",
          inputs: [
            {
              name: "txIndex",
              type: "uint256",
              indexed: true,
              internalType: "uint256",
            },
            {
              name: "owner",
              type: "address",
              indexed: true,
              internalType: "address",
            },
            {
              name: "destination",
              type: "address",
              indexed: true,
              internalType: "address",
            },
            {
              name: "value",
              type: "uint256",
              indexed: false,
              internalType: "uint256",
            },
            {
              name: "data",
              type: "bytes",
              indexed: false,
              internalType: "bytes",
            },
          ],
          anonymous: false,
        },
      ],
      inheritedFunctions: {},
    },
  },
} as const;

export default deployedContracts satisfies GenericContractsDeclaration;
