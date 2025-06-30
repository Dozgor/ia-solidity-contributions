
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MiniMultiSigWallet {

    // Liste des propriétaires
    address[] public owners;

    // Vérifie si une adresse est bien propriétaire
    mapping(address => bool) public isOwner;

    // Nombre minimal d'approbations requises pour exécuter une transaction
    uint public requiredApprovals;

    // Représente une transaction proposée
    struct Transaction {
        address to;
        uint256 value;
        bytes data;
        bool executed;
    }

    // Tableau des transactions soumises
    Transaction[] public transactions;

    // approvals[txIndex][owner] => bool (si owner a approuvé cette transaction)
    mapping(uint => mapping(address => bool)) public approvals;

    // Constructor : initialise les propriétaires
    constructor(address[] memory _owners, uint _requiredApprovals) {
        require(_requiredApprovals > 0 && _requiredApprovals <= _owners.length, "Nb approbations invalide");
        require(_owners.length > 0, "Au moins un proprietaire");
        for (uint i = 0; i < _owners.length; i++) {
            address owner = _owners[i];
            require(owner != address(0), "Adresse invalide");
            require(!isOwner[owner], "Doublon proprietaire");

            isOwner[owner] = true;
            owners.push(owner);
        }
        requiredApprovals = _requiredApprovals;
    }

    modifier onlyOwner() {
        require(isOwner[msg.sender], "Not an owner");
        _;
    }
    modifier txExists(uint txIndex) {
        require(txIndex < transactions.length, "Transaction does not exist");
    _;
    }

    // Soumet une nouvelle transaction à approuver par les propriétaires
    function submitTransaction(address to, uint256 value, bytes calldata data) external onlyOwner{
        transactions.push(Transaction({
            to: to,
            value: value,
            data: data,
            executed: false
        }));
    }

    // Approuve une transaction (si pas déjà approuvée par ce propriétaire)
    function approveTransaction(uint txIndex) external onlyOwner txExists(txIndex){
        require(!approvals[txIndex][msg.sender], "Deja approuvee");

        approvals[txIndex][msg.sender] = true;
    }

    // Retourne le nombre d'approbation actuel pour une transaction donnée
    function getApprovalCount(uint txIndex) public view onlyOwner returns (uint count) {
        for (uint i = 0; i < owners.length; i++) {
            if (approvals[txIndex][owners[i]]) {
            count += 1;
            }
        }
    }

    // Exécute une transaction si le nombre d'approbations est suffisant
    function executeTransaction(uint txIndex) external onlyOwner txExists(txIndex){

        Transaction storage TxToExecute = transactions[txIndex];

        require(!TxToExecute.executed, "Deja executee");

        uint count = getApprovalCount(txIndex);
        require(count >= requiredApprovals, "Pas assez d'approbations");

        TxToExecute.executed = true;

        (bool success, ) = TxToExecute.to.call{value: TxToExecute.value}(TxToExecute.data);
        require(success, "Execution echouee");

    }
}  