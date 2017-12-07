pragma solidity ^0.4.8;

contract BlockHashTest {
    function getBlockHash(uint _blockNumber) constant returns (bytes32 blockhash, uint blockhashToNumber){
        bytes32 _blockhash = block.blockhash(_blockNumber);
        uint _blockhashToNumber = uint(_blockhash);
        return (_blockhash, _blockhashToNumber);
    }
}
