// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.6 <0.9.0;
/// @title A contract for demonstrate how to create a contract
/// @author Ajith D
/// @notice For now, this contract just show how to pass the parameter into the constructor and set the value

contract SimpleBank{

    mapping(address => uint256) private _balance;

    function deposit() public payable{
        _balance[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) public {
        require(_balance[msg.sender] >= amount, "Insufficient Balance");
        payable(msg.sender).transfer(amount);
        _balance[msg.sender] -= amount;
    }

    function balance() public view returns (uint256){
        return _balance[msg.sender];
    }
}

SimpleBank contractInstance = SimpleBank(0123456);