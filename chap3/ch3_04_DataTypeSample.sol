pragma solidity ^0.4.8;

contract DataTypeSample {
  function getValueType() constant returns (uint) {
    uint a;          // uint형 변수 a를 선언. 이 시점에서 a는 0으로 초기화된다.
    a = 1;           // a의 값이 1이 된다.
    uint b = a;      // 변수 a에 a의 값 1이 대입
    b = 2;           // b의 값이 2가 된다.
    return a;        // a의 값인 1이 반환
  }

  function getReferenceType() constant return (uint[2]) {
    uint[2] a;       // uint 형식을 가진 배열 변수 a를 선언
    a[0] = 1;        // 배열의 첫 번째 요소의 값에 1을 대입. 
    a[1] = 2;        // 배열의 두 번째 요소의 값에 2를 대입.
    uint[2] b = a;   // uint 형식을 가진 배열 변수 b를 선언하고 a를 b에 대입. a는 데이터 영역 주소이기 때문에 b는 a와 동일한 데이터 영역을 참조함
    b[0] = 10;       // b와 a는 같은 데이터 영역을 참조하기 때문에 a[0]도 10이 된다.
    b[1] = 20;       // 마찬가지로 a[1]도 20이 된다
    return a;        // 10, 20이 반환된다.
  }
}