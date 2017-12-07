pragma solidity ^0.4.8;

contract SelfDestructSample {
  address public owner = msg.sender;    // 계약을 배포한 주소를 소유자로 한다
  //송금을 받는다(close() 뒤에 호출하면 송금도 할 수 없게 된다)
  function () payable { }
  // 계약을 파기하는 메서드
  function close() {
    if (owner != msg.sender) throw;   // 보내는 사람이 소유자가 아닌 경우는 예외 처리
    selfdestruct(owner);              // 계약을 파기한다
  }
  // 계약 잔고를 반환하는 메서드
  function Balance() constant returns (uint) {  // close() 뒤에 호출하면 오류 발생
    return this.balance;
  }
}

