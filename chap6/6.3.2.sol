pragma solidity ^0.4.8;

contract RandomNumber {
    address owner;
    // (1) 1~numberMax 의 난수 값을 생성하도록 설정하는 변수
    uint numberMax;

    // (2) 예약 객체
    struct draw {
        uint blockNumber;
        uint drawnNumber;
    }

    // (3) 예약 객체 배열
    struct draws {
        uint numDraws;
        mapping (uint => draw) draws;
    }

    // (4) 사용자(address)별로 예약 배열을 관리
    mapping (address => draws) requests;

    // (5) 이벤트(용도에 대해서는 이후 설명)
    event ReturnNextIndex(uint _index);
    event ReturnDraw(int _status, bytes32 _blockhash, uint _drawnNumber);

    // (6) 생성자
    function RandomNumber(uint _max) {
        owner = msg.sender;
        numberMax = _max;
    }

    // (7) 난수 생성 예약을 추가
    function request() returns (uint) {
        // (8) 현재 예약 갯수 취득
        uint _nextIndex = requests[msg.sender].numDraws;
        // (9) 마지막 블록의 블록 번호를 기록
        requests[msg.sender].draws[_nextIndex].blockNumber = block.number;
        // (10) 예약 갯수 카운트 증가
        requests[msg.sender].numDraws = _nextIndex + 1;
        // (11) 예약 번호 반환
        ReturnNextIndex(_nextIndex);
        return _nextIndex;
    }

    // (12) 예약된 난수 생성 결과 획득 시도
    function get(uint _index) returns (int status, bytes32 blockhash, uint drawnNumber){
        // (13) 존재하지 않는 예약 번호인 경우
        if(_index >= requests[msg.sender].numDraws){
            ReturnDraw(-2, 0, 0);
            return (-2, 0, 0);
        // (14) 예약 번호가 존재하는 경우
        }else{
            // (15) 예약시 기록한 block.number의 다음 블록 번호를 계산
            uint _nextBlockNumber = requests[msg.sender].draws[_index]. blockNumber + 1;
            // (16) 아직 다음 블록이 생성되지 않은 경우
            if (_nextBlockNumber >= block.number) {
                ReturnDraw(-1, 0, 0);
                return (-1, 0, 0);
            // (17) 다음 블록이 생성됐기 때문에 난수 계산
            }else{
                // (18) 블록 해시 값을 획득
                bytes32 _blockhash = block.blockhash(_nextBlockNumber);
                // (19) 블록 해시 값에서 난수 값을 계산
                uint _drawnNumber = uint(_blockhash) % numberMax + 1;
                // (20) 계산된 난수 값을 저장
                requests[msg.sender].draws[_index].drawnNumber = _drawnNumber;
                // (21) 결과를 반환
                ReturnDraw(0, _blockhash, _drawnNumber);
                return (0, _blockhash, _drawnNumber);
            }
        }
    }
}
