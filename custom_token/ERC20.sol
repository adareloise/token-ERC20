// SPDX-License-Identifier: MIT
pragma solidity >=0.4.4 <0.7.0;
pragma experimental ABIEncoderV2;
import "./SafeMath.sol";

// Interface token ERC20
interface IERC20{

    //total quantity
    function totalSupply() external view returns (uint256);

    //total quantity for address
    function balanceOf(address OwnerToken) external view returns (uint256);

    //return the token number that the spender will be able to spend on behalf of the owner
    function allawance(address owner, address delegate) external  view returns (uint256);

    //return boolean value result of operation
    function transfer(address recipient, uint256 amount) external returns (bool);

    //return boolean value result of expense operation
    function approve(address spender, uint256 amount) external returns (bool);

    //return boolean value result of pass operation in number of tokens whit allowance()
    function transferFrom(address sender, address recipient, uint256) external returns (bool);

    //emit event on a number of tokens from source to destination
    event Transfer(address indexed from, address indexed to, uint256 value);

    //emit event when set assignment whit allowance() 
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract ERC20Basic is IERC20{

    string public constant name = "ERCBLOCK1";
    string public constant symbol = "ERC";
    uint8 public constant decimals = 18; 

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    using SafeMath for uint256;

    mapping (address => uint) balences;
    mapping (address => mapping (address => uint)) allowed;
    uint256 totalSupply_;

    constructor (uint256 initSupply) public{
        totalSupply_ = initSupply;
        balences[msg.sender] = totalSupply_;
    }

    function totalSupply() public override view returns (uint256){
        return totalSupply_;
    }

    function increaseTotalSupply (uint newTokensAmout) public {
        totalSupply_ += newTokensAmout;
        balences[msg.sender] += newTokensAmout;
    }

    function balanceOf(address OwnerToken) public override view returns (uint256){
        return balences[OwnerToken];
    }

    function allawance(address owner, address delegate) public override view returns (uint256){
        return allowed[owner][delegate];
    }

    function transfer(address recipient, uint256 numTokens) public override returns (bool){
        
        require(numTokens <= balences[msg.sender]);
        balences[msg.sender] = balences[msg.sender].sub(numTokens);
        balences[recipient] = balences[recipient].add(numTokens);
        emit Transfer(msg.sender, recipient, numTokens);

        return true;
    }

    function approve(address spender, uint256 amount) public override returns (bool){
        return false;
    }

    function transferFrom(address sender, address recipient, uint256) public override returns (bool){
        return false;

    }

}