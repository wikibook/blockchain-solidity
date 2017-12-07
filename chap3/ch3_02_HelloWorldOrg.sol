pragma solidity ^0.4.8;
contract HelloWorld {
  string public greeting;
  function HelloWorld(string _greeting) {
    greeting = _greeting;
  }
  function setGreeting(string _greeting) {
    greeting = _greeting;
  }
  function say() constant returns (string) {
    return greeting;
  }
}
