pragma solidity ^0.4.8;

contract ArraySample {
  uint[5] public fArray = [uint(10), 20, 30, 40, 50];        // 고정 길이 배열의 선언 및 초기화
  uint[] public dArray;            // 가변 길이 배열 선언
  function getFixedArray() constant returns (uint[5]) {
    uint[5] storage a = fArray;  // 길이가 5인 고정 배열을 선언
    // 메서드 안에서는 이 형식으로 초기화할 수 없다.
    // uint[5] b = [uint(1), 2, 3, 4, 5]
    for (uint i = 0; i < a.length; i++) {    // 초기화
      a[i] = i + 1;
    }
    return a;                    // [1, 2, 3, 4, 5]를 반환
  }
  function getFixedArray2() constant returns (uint[5]) {
    uint[5] storage b = fArray;  // 상태 변수로 초기화
    return b;                    // [10, 20, 30, 40, 50] 을 반환
  }
  function pushFixedArray(uint x) constant returns (uint) {
    // 다음은 컴파일 오류가 발생한다
    // fArray.push(x);
    return fArray.length;
  }
  function pushDArray(uint x) returns (uint) {
    return dArray.push(x);       // 인수로 받은 요소를 추가하고 변경 후의 배열 길이를 반환
  }
  function getDArrayLength() returns (uint) {
    return dArray.length;        // 가변 길이 배열의 현재 크기를 반환
  }
  function initDArray(uint len) {
    dArray.length = len;         // 가변 길이 배열의 크기를 변경
    for (uint i = 0; i < len; i++) {    //초기화
      dArray[i] = i + 1;
    }
  }
  function getDArray() constant returns (uint[]) {
    return dArray;               // 가변 길이 배열도 반환
  }
  function delDArray() returns  (uint) {
    delete dArray;               // 가변 길이 배열 삭제
    return dArray.length;        // 0을 반환
  }
  function delFArray() returns (uint) {
    delete fArray;               // 고정 길이 배열 삭제. 각 요소는 0이 된다
    return fArray.length;        // 길이는 변하지 않기 때문에 5를 반환
  }
}
