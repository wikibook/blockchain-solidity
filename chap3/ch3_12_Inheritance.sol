pragma solidity ^0.4.8;

contract A {
  uint public a;
  function setA(uint _a) {
    a = _a;
  }
  function getData() constant returns (uint) {
    return a;       // a를 그대로 반환
  }
}

contract B is A { // B는 A의 하위 계약
  function getData() constant returns (uint) {
    return a * 10;  // a * 10을 반환
  }
}

contract C {
  A[] internal c;     // 데이터 형식을 계약 A 형식의 가변 길이 배열로 설정해 c로 선언
  function makeContract() returns(uint, uint) {
    c.length = 2;   // c의 길이를 2로 설정
    A a = new A();  // 계약 A를 a로 생성
    a.setA(1);      // 1을 할당
    c[0] = a;       // 배열의 첫 번째 요소에 a를 대입
    B b = new B();  // 계약 B를 b로 생성
    b.setA(1);      // 마찬가지로 1을 할당
    c[1] = b;       // 배열의 두 번째 요소에 b를 대입
    return (c[0].getData(), c[1].getData());  // 계약 A와 B의 반환값을 출력
  }
}

