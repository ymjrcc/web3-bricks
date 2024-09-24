// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";

interface IToken {
    function mint(address to, uint256 amount) external;
}

contract MerkleAirdrop {

    IToken public immutable mToken;
    bytes32 public immutable merkleRoot;
    mapping(bytes32 => bool) public claimed;

    constructor(address token_, bytes32 merkleRoot_) {
        mToken = IToken(token_);
        merkleRoot = merkleRoot_;
    }

    function getLeafHash(address to, uint256 amount) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(to, amount));
    }

    function claim(bytes32[] memory proof, address to, uint256 amount) external {
        require(msg.sender == to, "You are not the recipient.");
        bytes32 leaf = getLeafHash(to, amount);
        require(!claimed[leaf], "Already claimed.");
        require(MerkleProof.verify(proof, merkleRoot, leaf), "Invalid proof.");
        claimed[leaf] = true;
        mToken.mint(to, amount);
        emit Claim(to, amount);
    }

    function verify(bytes32[] memory proof, address to, uint256 amount) external view returns (bool) {
        bytes32 leaf = getLeafHash(to, amount);
        require(!claimed[leaf], "Already claimed.");
        return MerkleProof.verify(proof, merkleRoot, leaf);
    }

    event Claim(address indexed to, uint256 amount);
}


