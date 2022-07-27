// SPDX-License-Identifier: MIT
pragma solidity >=0.4.4 <0.7.0;
pragma experimental ABIEncoderV2;
import "./SafeMath.sol";
import "./ERC20.sol";

contract Disney{

    // Instance contract token
    ERC20Basic private token;
    address payable public owner;

    constructor () public {
        token = new ERC20Basic(10000);
        owner = msg.sender;
    } 

    // Structure data for containt clients
    struct client {
        uint tokens_buy;
        string [] attraction;
    }

    // Mapping for client registry
    mapping (address => client) public Client;
}