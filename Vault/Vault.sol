pragma solidity 0.4.18;

/**
 * @title Vault WEA 
 * @author  WEA CEO
 * @version 0.1 Beta
 *
 * @section LICENSE
 * Contrato con registros en DIBAM, Santiago de Chile,
 * cualquier uso, copia u raminifación de este código está
 * extrictamente prohibido, así como también el código del
 * frontend que resulte de mencionado contrato.
 *
 */

contract Vault {

    address public  owner;
    uint public time;

    /**
    *@dev change those names for log
    **/
    event retire (string mensaje, uint monto);
    event deposit (string mensaje, uint monto);

    function Vault(uint _time) public {
        owner = msg.sender;
        time = _time;
    }
    
    /**
    *@dev no modifier required
    **/
    function reclaim() public {
        require(msg.sender == owner && time < now);
        owner.transfer(this.balance);
        retire('se han retirado:', this.balance);
    }

    function() public payable {
        deposit('se ha depositado:', msg.value);
    }
}
