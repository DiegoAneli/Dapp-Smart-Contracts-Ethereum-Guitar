pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Purchasing.sol";

contract TestPurchasing {
 	// Indirizzo del contratto di acquisto da testare//
	Purchasing purchasing = Purchasing(DeployedAddresses.Purchasing());

 	// Id della tecnica che verrà utilizzato per i test//
 	uint expectedArtId = 4;

 	// Acquirente atteso di Art è questo contratto
 	address expectedBuyer = address(this);

 	// Test della funzione di acquisto//
 	function testUserCanPurchaseArt() public {
  		uint returnedId = purchasing.purchase(expectedArtId);

  		Assert.equal(returnedId, expectedArtId, "Test function purchase OK");
	}

	// Verifica del recupero del proprietario di un singolo//
	function testGetBuyerAddressByArtId() public {
  		address buyer = purchasing.buyers(expectedArtId);

  		Assert.equal(buyer, expectedBuyer, "Test Get Buyer Address OK");
	}

	// Verifica del recupero di tutti gli acquirenti//
	function testGetBuyerAddressByArtIdInArray() public {
  		// Memorizza buyers ma non nell archiviazione contratto//
  		address[6] memory buyers = purchasing.getBuyers();

  		Assert.equal(buyers[expectedArtId], expectedBuyer, "Test retrieval of all buyers OK");
	}

}
