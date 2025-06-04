// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title SimpleDAO - A lightweight DAO for collective fund management
/// @author Dozgor
/// @notice This contract allows a group to submit spending proposals and execute them once a majority approves
contract SimpleDAO {
    // DAO members
    address[] public members;
    mapping(address => bool) public isMember;

    // Required approvals for execution
    uint public requiredApprovals;

    // A proposal to send ETH to a recipient
    struct Proposal {
        address payable recipient;
        uint amount;
        bool executed;
    }

    Proposal[] public proposals;
    mapping(uint => mapping(address => bool)) public approvals;

    // ------------------- Constructor -------------------

    constructor(address[] memory _members, uint _requiredApprovals) {
        require(_members.length > 0, "At least one member required");
        require(_requiredApprovals > 0 && _requiredApprovals <= _members.length, "Invalid approval threshold");

        for (uint i = 0; i < _members.length; i++) {
            address member = _members[i];
            require(member != address(0), "Invalid address");
            require(!isMember[member], "Duplicate member");

            isMember[member] = true;
            members.push(member);
        }

        requiredApprovals = _requiredApprovals;
    }

    // ------------------- Modifiers -------------------

    modifier onlyMember() {
        require(isMember[msg.sender], "Not a DAO member");
        _;
    }

    modifier proposalExists(uint proposalIndex) {
        require(proposalIndex < proposals.length, "Proposal does not exist");
        _;
    }

    modifier notExecuted(uint proposalIndex) {
        require(!proposals[proposalIndex].executed, "Already executed");
        _;
    }

    // ------------------- Core Functions -------------------

    /// @notice Submit a new spending proposal
    function submitProposal(address payable recipient, uint amount) external onlyMember {
        proposals.push(Proposal({
            recipient: recipient,
            amount: amount,
            executed: false
        }));
    }

    /// @notice Approve a proposal
    function approveProposal(uint proposalIndex)
        external
        onlyMember
        proposalExists(proposalIndex)
        notExecuted(proposalIndex)
    {
        require(!approvals[proposalIndex][msg.sender], "Already approved");
        approvals[proposalIndex][msg.sender] = true;
    }

    /// @notice Execute a proposal if enough approvals are collected
    function executeProposal(uint proposalIndex)
        external
        onlyMember
        proposalExists(proposalIndex)
        notExecuted(proposalIndex)
    {
        Proposal storage p = proposals[proposalIndex];
        uint count = getApprovalCount(proposalIndex);
        require(count >= requiredApprovals, "Not enough approvals");

        p.executed = true;
        (bool success, ) = p.recipient.call{value: p.amount}("");
        require(success, "Transfer failed");
    }

    /// @notice Count approvals for a given proposal
    function getApprovalCount(uint proposalIndex) public view returns (uint count) {
        for (uint i = 0; i < members.length; i++) {
            if (approvals[proposalIndex][members[i]]) {
                count += 1;
            }
        }
    }

    // ------------------- Fallback -------------------

    /// @notice Allow contract to receive ETH
    receive() external payable {}
}