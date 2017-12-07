pragma solidity ^0.4.8;

contract MappingSample {
  struct User {
    string name;
    uint age;
  }
  mapping(address=>User) public userList; // value를 구조체(User)로 설정

  function setUser(string _name, uint _age) {
    userList[msg.sender].name = _name;    // key를 지정해 접근한다
    userList[msg.sender].age = _age;
  }

  function getUser() returns (string, uint) {
    User u = userList[msg.sender];
    return (u.name, u.age);
  }
}
