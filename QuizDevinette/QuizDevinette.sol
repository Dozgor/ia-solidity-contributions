// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract QuizDevinette {
    address public owner;
    string public question;
    bytes32 private reponseHash;
    
    constructor() {
        owner = msg.sender;
    }

    function poserDevinette(string memory _question, string memory _reponseClaire) public {
        require(msg.sender == owner, "Seul le proprietaire peut poser la devinette");
        question = _question;
        reponseHash = keccak256(abi.encodePacked(_reponseClaire));
    }

    event ReponseTrouvee(address gagnant);

    function deviner(string memory proposition) public {
        require(bytes(question).length != 0, "Aucune devinette n'est active");
    
        if (keccak256(abi.encodePacked(proposition)) == reponseHash) {
        emit ReponseTrouvee(msg.sender);
        }
    }
}
    
