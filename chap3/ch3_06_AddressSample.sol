pragma solidity ^0.4.8;

contract AddressSample {
  // 이름 없는 함수(송금되면 실행된다) payable을 지정해 Ether를 받는 것이 가능
  function () payable {}
  function getBalance(address _target) constant returns (uint) {
    if (_target == address(0)) {        // _target이 0인 경우 계약 자신의 주소를 할당
      _target = this;
    }
    return _target.balance;             // 잔고 반환
  }
  // 이후, 송금 메서드를 실행하기 전 이 계약에 대해 송금해둬야 한다
  // 인수로 지정된 주소에 transfer를 사용해 송금
  function send(address _to, uint _amount) {
    if (!_to.send(_amount)) {           // send를 사용할 경우 반환값을 체크해야 한다
      throw;
    }
  }
  // 인수로 지정된 주소에 call을 사용해 송금
  function call(address _to, uint _amount) {
    if (!_to.call.value(_amount).gas(1000000)()) {     // call도 반환값을 체크해야 한다
      throw;    // 
    }
  }
  // 인출 패턴(transfer)
  function withdraw() {
    address to = msg.sender;            // 메서드 실행자를 받는 사람으로 한다
    to.transfer(this.balance);          // 전액 송금한다
  }
  // 인출 패턴(call)
  function withdraw2() {
    address to = msg.sender;            // 메서드 실행자를 받는 사람으로 한다
    if (!to.call.value(this.balance).gas(1000000)()) {    // 전액 송금한다
        throw;
    }
  }
}

