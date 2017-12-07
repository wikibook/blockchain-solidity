pragma solidity ^0.4.8;
import "github.com/oraclize/ethereum-api/oraclizeAPI.sol";

contract RandomNumberOraclized is usingOraclize{
    uint public randomNumber;
    bytes32 public request_id;

    function RandomNumberOraclized() {
        // (1) Oraclize Address Resolver를 읽어온다
        // <OAR주소를 지정. deterministic OAR인 경우 이 행은 필요 없다.
        OAR = OraclizeAddrResolverI(0x55359e7e492218E4CF8112FCe6a8Ef7e319eA4fB);
    }

    function request() {
        // (2) wolframAlpha에서 난수를 받아오도록 의뢰
        // 디버그를 위해 request_id에 Oraclize 처리 의뢰 번호를 저장해둔다
        request_id = oraclize_query("WolframAlpha", "random number between 1 and 6");
    }

    // (3) Oraclize 측에서 외부 처리가 실행되면 이 __callback 함수를 호출한다
    function __callback(bytes32 request_id, string result) {
        if (msg.sender != oraclize_cbAddress()) {
            throw;
        }

        // (4) 실행 결과 result를 drawnNumber에 저장
        randomNumber = parseInt(result);
    }
}
