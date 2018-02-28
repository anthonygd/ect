pragma solidity ^0.4.19;

import "contracts/ERC20.sol";

contract EthereumColumbusToken is ERC20 {

    // Constants
    string public constant name = "Ethereum Columbus Token";
    string public constant symbol = "ECT";
    uint8 public constant decimals = 18;

    // Standard view functions
    function totalSupply() public constant returns (uint) {

    }

    function balanceOf(address _tokenOwner) public constant returns (uint balance) {

    }

    function allowance(address _tokenOwner, address _spender) public constant returns (uint remaining) {

    }

    // Standard update functions
    function transfer(address _to, uint _tokens) public returns (bool success) {

    }

    function approve(address _spender, uint _tokens) public returns (bool success) {

    }

    function transferFrom(address _from, address _to, uint _tokens) public returns (bool success) {

    }

    // Non-Standard creation function
    function mint(uint _tokens) public returns (bool success) {
        
    }
}
