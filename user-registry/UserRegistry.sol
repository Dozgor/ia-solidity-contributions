// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UserRegistry{
   
   mapping (address => User) public users;
   address public owner;
   struct User { 
      string name; 
      address useraddress;
      uint age;
   }
   constructor(){
      owner = msg.sender;
   }
  function registerUser(string calldata name, uint age) public {
      users[msg.sender] = User({
         name: name,
         useraddress: msg.sender,
         age: age
      });
   }
   function getUser(address userAddr) public view returns (string memory, address, uint) {
      User memory u = users[userAddr];
      return (u.name, u.useraddress, u.age);
   }
}
   