pragma solidity ^0.5.0;

contract Purchasing {

	address [6] public buyers; //Array di indirizzi Eth pubblico per accedere dall esterno//

	function purchase(uint artId) public returns (uint) {
  		require(artId >= 0 && artId <= 5); //require : valida la condizione che in caso non affermativo interrompe l’esecuzione dello smart contract//

  		require (buyers[artId] == address(0x0)); //indirizzo non assegnato : (0x0)//

  		buyers[artId] = msg.sender;	//L indirizzo della persona o del contratto che ha chiamato questa funzione è indicato da msg.sender//

  		return artId;
	}

	function getBuyers() public view returns (address[6] memory) {
  		return buyers; //funzione che restituisce tutta la lista acquirenti,'view' non modifica lo stato dello smart contract//
	}

}
