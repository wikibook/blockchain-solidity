pragma solidity ^0.4.8;

contract EtherUnitSample {
  function () payable {} // Ether를 받는 메서드

  // getEther 실행 전에 이 계약에 1 ether를 송금해야 한다
  function getEther() constant returns (uint _wei, uint _szabo, uint _finney, uint _ether) {
    uint amount = this.balance;   // 1000000000000000000
    _wei = amount / 1 wei;        // 1000000000000000000
    _szabo = _wei / 1 szabo;      // 1000000
    _finney = _wei / 1 finney;    // 1000
    _ether = _wei / 1 ether;      // 1
  }
}
