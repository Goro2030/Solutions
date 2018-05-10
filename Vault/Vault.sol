pragma solidity 0.4.18;

contract Vault {

    address public  owner;
    uint public time;

    event retire (string mensaje, uint monto);
    event deposit (string mensake, uint monto);

    function Vault(uint _time) public {
        owner = msg.sender;
        time = _time;
    }

    function reclaim() public {
        require(msg.sender == owner && time < now);
        owner.transfer(this.balance);
        retire('se han retirado:', this.balance);
    }

    function() public payable {
        deposit('se ha depositado:', msg.value);
    }
}
