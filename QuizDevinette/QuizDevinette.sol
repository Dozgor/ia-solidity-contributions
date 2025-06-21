// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract QuizDevinette {
    address public owner;
    string public question;
    bytes32 private reponseHash;

    
