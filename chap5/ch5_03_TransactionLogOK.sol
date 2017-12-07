pragma solidity ^0.4.8;
contract PersonCertification {
    address admin;
    struct AppDetail {
        bool allowReference;
        uint256 approveBlockNo;
        uint256 refLimitBlockNo;
        address applicant;
    }
    struct PersonDetail {
        string name;
        string birth;
        address[] orglist;
    }
    struct OrganizationDetail {
        string name;
    }
    mapping(address => AppDetail) appDetail;
    mapping(address => PersonDetail) personDetail;
    mapping(address => OrganizationDetail) public orgDetail;
    function PersonCertification() {
        admin = msg.sender;
    }
    function setPerson(string _name, string _birth) {
        personDetail[msg.sender].name = _name;
        personDetail[msg.sender].birth = _birth;
    }
    function setOrganization(string _name) {
         orgDetail[msg.sender].name = _name;
    }
    function setBelong(address _person) {
        personDetail[_person].orglist.push(msg.sender);
    }
    function setApprove(address _applicant, uint256 _span) {
        appDetail[msg.sender].allowReference = true;
        appDetail[msg.sender].approveBlockNo = block.number;
        appDetail[msg.sender].refLimitBlockNo = block.number + _span;
        appDetail[msg.sender].applicant = _applicant;
    }
    function getPerson(address _person) public constant returns(
                                        bool _allowReference,
                                        uint256 _approveBlockNo,
                                        uint256 _refLimitBlockNo,
                                        address _applicant,
                                        string _name,
                                        string _birth,
                                        address[] _orglist) {
        _allowReference  = appDetail[_person].allowReference;
        _approveBlockNo  = appDetail[_person].approveBlockNo;
        _refLimitBlockNo = appDetail[_person].refLimitBlockNo;
        _applicant       = appDetail[_person].applicant;
        if (((msg.sender == _applicant) 
          && (_allowReference == true) 
          && (block.number < _refLimitBlockNo)) 
         || (msg.sender == admin) 
         || (msg.sender == _person)) {
            _name    = personDetail[_person].name;
            _birth   = personDetail[_person].birth;
            _orglist = personDetail[_person].orglist;
        }
    }
}
