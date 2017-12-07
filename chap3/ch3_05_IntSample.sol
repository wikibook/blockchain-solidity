pragma solidity ^0.4.8;

contract IntSample {
  function division() constant returns (uint) {
    uint a = 3;
    uint b = 2;
    uint c = a / b * 10       // a / b 의 결과는 1이다.
    return c;                 // 10이 반환된다.
  }
  function divisionLiterals() constant returns (uint) {
    uint c = 3 / 2 * 10;      // 상수이기 때문에 a / b의 나머지를 버리지 않는다. 즉 1.5가 된다.
    return c;                 // 15가 반환된다.
  }
  function divisionByZero() constant returns (uint) {
    uint a = 3;
    uint c = a / 0;           // 컴파일은 되지만 실행 시 예외가 발생한다.
    return c;                 // uint c = 3 / 0으로 하면 컴파일도 진행되지 않는다.
  }
  function shift() constant returns (uint[2]) {
    uint[2] a;
    a[0] = 16 << 2;           // 16 * 2 ** 2 = 64
    a[1] = 16 >> 2;           // 16 / 2 ** 2 = 4
    return a;                 // 64, 4가 반환된다.
  }
}

