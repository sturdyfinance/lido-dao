// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.9;
import "./interfaces/ILido.sol";
import "./interfaces/ISTETH.sol";

contract Assignment {

    mapping(address => uint) private balances;
    ILido public Lido;
    ISTETH public StEth;

    constructor(ILido _lido, ISTETH _iStEth) {
        Lido = ILido(_lido);
        StEth = ISTETH(_iStEth);
    }

    function depositToLido(address referrer) public payable {
        uint256 value = Lido.submit{value:msg.value}(referrer);
        balances[msg.sender] += value;
    }

    function withdrawStETH(uint256 amount) public {
        require(amount <= balances[msg.sender],"Not enough balance");
        balances[msg.sender] -= amount;
        StEth.transfer(msg.sender, amount);
    }
}