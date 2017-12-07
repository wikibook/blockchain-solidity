pragma solidity ^0.4.8;

contract StructSample {
  struct User {           // 구조체 선언 (C 언어와 동일)
  address addr;
  string name;
  }
  User[] public userList; // 구조체의 배열도 선언할 수 있다
  function addUser(string _name) returns (uint) {   // 사용자 추가
    uint id = userList.push(User({                // 배열의 가장 마지막에 추가한다
      addr: msg.sender,
      name: _name
    }));
    return (id - 1);
  }
  function addUser2(string _name) returns (uint) {  // 사용자 추가
    userList.length += 1;                    // 배열의 길이를 1만큼 증가시킨다
    uint id = userList.length - 1;
    userList[id].addr = msg.sender;
    userList[id].name = _name;
    return id;
  }
  function editUser(uint _id, string _name) {
    if (userList.length <= _id ||            // id가 배열의 길이 이상
      userList[_id].addr != msg.sender)     // 주소가 등록된 것과 다르다
    {
      throw;         // 예외 처리
    }
    userList[_id].name = _name;
  }

  // 구조체는 직접 반환하지 않기 때문에 다음 메서드는 컴파일 오류가 발생한다
  // function getUser(uint _id) constant returns (User) {
  //     return userList[_id];
  // }
  // 아래 메서드는 문제 없음
  function getUser(uint _id) constant returns (address, string) {
    return (userList[_id].addr, userList[_id].name);
  }
}

