pragma solidity ^0.4.8;

contract A {
  uint public num = 10;  // 10으로 고정한다(public이기 때문에 외부에서 참조 가능).
  function getNum() constant returns (uint) {
    return num;
  }
}
 
contract B {
  A a = new A();
  address public addr;
  function setA(A _a) { // 별도로 생성한 A의 주소를 설정한다.
    addr = _a;   // 주소에 저장
  }
  // 상태 변수num의 값을 직접 취득
  function aNum() constant returns (uint) {
    return a.num(); // 10;
  }
  // 메서드로부터 num의 값을 취득
  function aGetNum() constant returns (uint) {
    return a.getNum(); // 10
  }
}

