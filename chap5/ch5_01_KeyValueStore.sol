pragma solidity ^0.4.8;
contract KeyValueStore {
    uint256 keyIndex; 
    struct values {
        string value1;
        string value2; 
    }
    mapping (uint256 => values) Obj;
    function setValue(string _value1, string _value2) constant returns (uint256) {
        Obj[keyIndex].value1 = _value1;
        Obj[keyIndex].value2 = _value2;
        keyIndex++;
        return keyIndex;
    }
    function getValue1(uint _key) constant returns (string) {
        return Obj[_key].value1;
    }
    function getValue2(uint _key) constant returns (string) {
        return Obj[_key].value2;
    }
}
