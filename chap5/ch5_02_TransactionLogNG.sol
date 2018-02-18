pragma solidity ^0.4.8;

// (1) 거래 로그 계약 선언
contract TransactionLogNG {
    // (2) 저장소 정의
    mapping (bytes32 => mapping (bytes32 => string)) public tranlog;

    // (3) 거래 내용 등록
    function setTransaction(bytes32 user_id, bytes32 project_id, string tran_data) public {
        // (4) 등록
        tranlog[user_id][project_id] = tran_data;
    }
    
    // (5) 사용자, 프로젝트별 거래 내용을 가져온다
    function getTransaction(bytes32 user_id, bytes32 project_id) public constant returns (string tran_data) {
        return tranlog[user_id][project_id];
    }
}

