pragma solidity ^0.4.8;

contract TimeUnitSample {
  uint public startTime; // 시작 시간
  // 시작
  function start() {
    startTime = now;   // now는 block.timestamp의 별칭(Alias)
  }
  // 시작 시간으로부터 지정한 '분'만큼 경과했는지 확인(bool 형태로 반환)
  function minutesAfter(uint min) constant returns (bool) {
    if (startTime == 0) return false; // 시작 전에는 false를 반환
    return ((now - startTime) / 1 minutes >= min);
  }
  // 경과한 '초'를 반환
  function getSeconds() constant returns (uint) {
    if (startTime == 0) return 0; // 시작 전에는 0을 반환
    return (now - startTime);
  }
}

