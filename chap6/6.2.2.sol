pragma solidity ^0.4.8;

contract RandomNumber {
    function get(uint max) constant returns (uint, uint) {
        // (1) 가장 마지막 블록이 생성된 시각을 정수 값으로 반환
        uint block_timestamp = block.timestamp;

        // (2) 그 값을 max로 나눈 나머지를 계산
        // max = 6인 경우 나머지는 0~5의 정수이므로 +1를 해 1~6의 정수로 만든다
        uint mod = block_timestamp % max + 1;

        return (block_timestamp, mod);
    }
}
