// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IERC721 {
    function ownerOf(uint256 _nftId) external view returns (address);
    function transferFrom(address _from, address _to, uint256 _nftId) external;
    function isApprovedForAll(address _owner, address _operator) external view returns (bool);
    function getApproved(uint256 _nftId) external view returns (address);
}

contract DutchAuction {
  struct Auction {
    IERC721 nft;
    uint256 nftId;
    address payable seller;
    uint256 startPrice;
    uint256 endPrice;
    uint32 startAt;
    uint32 duration;
    bool isActive;
    address buyer;
    uint256 dealPrice;
  }

  mapping(uint256 => Auction) public auctions;
  uint256 public auctionId;

  event AuctionCreated(uint256 indexed id, address indexed seller, uint256 startPrice, uint32 endAt);
  event AuctionSuccessful(uint256 indexed id, address indexed buyer, uint256 dealPrice);

  function createAuction(
    address _nft, 
    uint256 _nftId, 
    uint256 _startPrice,
    uint256 _endPrice,
    uint32 _duration
  ) external {
    IERC721 nft = IERC721(_nft);
    require(_nft != address(0), "Invalid nft address");
    require(_startPrice > 0, "Invalid start price");
    require(_endPrice <= _startPrice && _endPrice > 0, "Invalid end price");
    require(_duration > 0, "Invalid duration time");
    require(nft.ownerOf(_nftId) == msg.sender, "Caller is not the owner of the NFT");
    require(
      nft.isApprovedForAll(msg.sender, address(this)) || 
      nft.getApproved(_nftId) == address(this), 
      "NFT is not approved for auction"
    );

    uint256 id = auctionId++;
    Auction storage auction = auctions[id];
    auction.nft = nft;
    auction.nftId = _nftId;
    auction.seller = payable(msg.sender);
    auction.startPrice = _startPrice;
    auction.endPrice = _endPrice;
    auction.startAt = uint32(block.timestamp);
    auction.duration = _duration;
    auction.isActive = true;

    emit AuctionCreated(id, msg.sender, _startPrice, uint32(block.timestamp) + _duration);
  }

  function getPrice(uint256 _id) public view returns (uint256) {
    Auction memory auction = auctions[_id];
    require(auction.isActive, "Auction is not active");
    if (block.timestamp - auction.startAt >= auction.duration) {
      return auction.endPrice;
    }
    uint256 priceDiff = auction.startPrice - auction.endPrice; // 总价差  
    uint256 timeElapsed = block.timestamp - auction.startAt; // 已经过去的时间
    return auction.startPrice - priceDiff * timeElapsed / auction.duration; // 当前价格
  }

  function buy(uint256 _id) external payable {
    Auction storage auction = auctions[_id];
    require(auction.isActive, "Auction is not active");
    uint256 price = getPrice(_id);
    require(msg.value >= price, "Invalid bid price");

    auction.isActive = false;
    auction.buyer = msg.sender;
    auction.dealPrice = price;

    auction.nft.transferFrom(auction.seller, msg.sender, auction.nftId);

    uint256 refund = msg.value - price;
    if (refund > 0) {
      payable(msg.sender).transfer(refund);
    }
    auction.seller.transfer(price);

    emit AuctionSuccessful(_id, msg.sender, price);
  }
}