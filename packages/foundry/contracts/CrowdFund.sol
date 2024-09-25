// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface ICFToken {
    function transfer(address, uint256) external returns (bool);
    function transferFrom(address, address, uint256) external returns (bool);
}

contract CrowdFund {

    struct Campaign {
        address creator;    // 众筹发起人
        uint256 goal;       // 众筹目标金额
        uint256 pledged;    // 当前已筹金额
        uint32 startAt;     // 众筹开始时间
        uint32 endAt;       // 众筹结束时间
        bool claimed;       // 是否成功并取出代币
    }

    ICFToken public immutable token;    // 代币合约地址
    uint256 public count;             // 众筹计数器
    mapping(uint256 => Campaign) public campaigns;    // 众筹列表
    mapping(uint256 => mapping(address => uint256)) public pledgedAmount;    // 抵押列表
    
    constructor(address token_) {
        token = ICFToken(token_);
    }

    function launch(uint256 _goal, uint32 _startAt, uint32 _endAt) external {
        require(_goal > 0, "Goal must be greater than 0");
        require(_startAt > block.timestamp, "Start time must be greater than current time");
        require(_endAt > _startAt, "End time must be greater than start time");
        
        count++;
        campaigns[count] = Campaign({
            creator: msg.sender,
            goal: _goal,
            pledged: 0,
            startAt: _startAt,
            endAt: _endAt,
            claimed: false
        });

        emit Launch(count, msg.sender, _goal, _startAt, _endAt);
    }

    function cancel(uint256 _id) external {
        Campaign memory campaign = campaigns[_id];
        require(campaign.creator == msg.sender, "Only creator can cancel");
        require(block.timestamp < campaign.startAt, "Cannot cancel after start time");

        delete campaigns[_id];
        emit Cancel(_id);
    }

    function pledge(uint256 _id, uint256 _amount) external {
        Campaign storage campaign = campaigns[_id];
        require(campaign.creator != address(0), "Campaign not found");
        require(block.timestamp >= campaign.startAt, "Campaign not started");
        require(block.timestamp < campaign.endAt, "Campaign ended");
        require(!campaign.claimed, "Campaign claimed");

        campaign.pledged += _amount;
        pledgedAmount[_id][msg.sender] += _amount;
        token.transferFrom(msg.sender, address(this), _amount);

        emit Pledge(_id, msg.sender, _amount);
    }

    function unpledge(uint256 _id, uint256 _amount) external {
        Campaign storage campaign = campaigns[_id];
        require(campaign.creator != address(0), "Campaign not found");
        require(block.timestamp < campaign.endAt, "Campaign ended");
        require(!campaign.claimed, "Campaign claimed");
        require(pledgedAmount[_id][msg.sender] >= _amount, "Insufficient pledged amount");

        campaign.pledged -= _amount;
        pledgedAmount[_id][msg.sender] -= _amount;
        token.transfer(msg.sender, _amount);

        emit Unpledge(_id, msg.sender, _amount);
    }

    function claim(uint256 _id) external {
        Campaign storage campaign = campaigns[_id];
        require(campaign.creator != address(0), "Campaign not found");
        require(block.timestamp >= campaign.endAt, "Campaign not ended");
        require(campaign.pledged >= campaign.goal, "Campaign not reached goal");
        require(campaign.creator == msg.sender, "Only creator can claim");
        require(!campaign.claimed, "Campaign claimed");

        campaign.claimed = true;
        token.transfer(msg.sender, campaign.pledged);

        emit Claim(_id);
    }

    function refund(uint256 _id) external {
        Campaign memory campaign = campaigns[_id];
        require(campaign.creator != address(0), "Campaign not found");
        require(block.timestamp >= campaign.endAt, "Campaign not ended");
        require(campaign.pledged < campaign.goal, "Campaign reached goal");
        require(!campaign.claimed, "Campaign claimed");
        require(pledgedAmount[_id][msg.sender] > 0, "No pledged amount");

        uint256 amount = pledgedAmount[_id][msg.sender];
        pledgedAmount[_id][msg.sender] = 0;
        token.transfer(msg.sender, amount);

        emit Refund(_id, msg.sender, amount);
    }

    // 发起众筹
    event Launch(uint256 indexed id, address indexed creator, uint256 goal, uint32 startAt, uint32 endAt);
    // 取消众筹
    event Cancel(uint256 indexed id);
    // 抵押
    event Pledge(uint256 indexed id, address indexed caller, uint256 amount);
    // 取消抵押
    event Unpledge(uint256 indexed id, address indexed caller, uint256 amount);
    // 众筹成功，取出代币
    event Claim(uint256 indexed id);
    // 众筹失败，退回代币
    event Refund(uint256 indexed id, address indexed caller, uint256 amount);
}