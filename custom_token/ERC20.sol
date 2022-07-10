// SPDX-License-Identifier: MIT
pragma solidity >=0.4.4 <0.7.0;
pragma experimental ABIEncoderV2;
import "./SafeMath.sol";

// Interface token ERC20
interface IERC20{

    //total quantity
    function totalSupply() external view returns (uint256);

    //total quantity for address
    function balanceOf(address account) external view returns (uint256);

    //return the token number that the spender will be able to spend on behalf of the owner
    function allawance(address owner, address spender) external  view returns (uint256);

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

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    using SafeMath for uint256;

    function totalSupply() public override view returns (uint256){
        return 0;
    }

    function balanceOf(address account) public override view returns (uint256){
        return 0;
    }

    function allawance(address owner, address spender) public override view returns (uint256){
        return 0;
    }

    function transfer(address recipient, uint256 amount) public override returns (bool){
        return false;
    }

    function approve(address spender, uint256 amount) public override returns (bool){
        return false;
    }

    function transferFrom(address sender, address recipient, uint256) public override returns (bool){
        return false;

    }

}