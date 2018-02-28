pragma solidity ^0.4.18;

import "contracts/ERC20.sol";
import "contracts/SafeMath.sol";

contract EthereumColumbusToken is ERC20 {

    // Constants
    string public constant name = "Ethereum Columbus Token";
    string public constant symbol = "ECT";
    uint8 public constant decimals = 18;

    // Private data structures
    mapping (address => uint) private balances;
    mapping (address => mapping (address => uint)) private allowances;
    uint private supply;
    address contract_owner;

    // Minimal setup required
    function EthereumColumbusToken() public {
      contract_owner = msg.sender;
    }

    // Standard view functions
    function totalSupply() public constant returns (uint) {
      return supply;
    }

    function balanceOf(address _tokenOwner) public constant returns (uint balance) {
      return balances[_tokenOwner];
    }

    function allowance(address _tokenOwner, address _spender) public constant returns (uint remaining) {
      return allowances[_tokenOwner][_spender];
    }

    // Standard update functions
    function transfer(address _to, uint _tokens) public returns (bool success) {
      balances[msg.sender] = SafeMath.sub(balances[msg.sender], _tokens);
      balances[_to] = SafeMath.add(balances[_to], _tokens);

      Transfer(msg.sender, _to, _tokens);

      return true;
    }

    function approve(address _spender, uint _tokens) public returns (bool success) {
      allowances[msg.sender][_spender] = _tokens;

      Approval(msg.sender, _spender, _tokens);

      return true;
    }

    function transferFrom(address _from, address _to, uint _tokens) public returns (bool success) {
      allowances[_from][_to] = SafeMath.sub(allowances[_from][_to], _tokens);
      balances[_from] = SafeMath.sub(balances[_from], _tokens);
      balances[_to] = SafeMath.add(balances[_to], _tokens);

      Transfer(_from, _to, _tokens);

      return true;
    }

    // Non-Standard creation function
    function mint(uint _tokens) public returns (bool success) {
      require(msg.sender == contract_owner);
      balances[msg.sender] = SafeMath.add(balances[msg.sender], _tokens);
      supply = SafeMath.add(supply, _tokens);
      return true;
    }
}
