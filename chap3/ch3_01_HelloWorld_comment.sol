pragma solidity ^0.4.8;     // (1) 버전 프라그마

// (2) 계약 선언
contract HelloWorld {
  // (3) 상태 변수 선언
  string public greeting;
  // (4) 생성자
  function HelloWorld(string _greeting) {
    greeting = _greeting;
  }
  // (5) 메서드 선언
  function setGreeting(string _greeting) {
    greeting = _greeting;
  }
  function say() constant returns (string) {
    return greeting;
  }
}
