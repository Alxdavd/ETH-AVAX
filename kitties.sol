// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;


contract KittiesRequire {

    uint[] public NFT_ID = [1,2,3,4,5];

    function viewNFT(uint i) public view returns(uint){

        require(i < (NFT_ID.length - 1), "No NFTs Found");
        return NFT_ID[i];
    }
}

contract KittiesRevert {

    uint public balance = address(this).balance;
    uint[] public NFT_ID;

    function AddBalance(uint _addValue) public returns(uint){

        if(_addValue<0){
            revert("Input value should be more than 0");
            }
            else{
            balance += _addValue;
            return  balance;
            }
    }

    function BuyNFT(uint _price, uint _ID) public returns(uint) {

        if (_price > balance) {
            revert("Not Enough Balance!");
        }
        else{
            NFT_ID.push(_ID);
            balance -= _price;
            return balance;
        }
    }

}

contract KittiesAssert {

    uint public balance = address(this).balance;


 function AddBalance(uint _addValue) public returns(uint){

            balance += _addValue;
            return  balance;
    }


    function balanceAssert(uint _priceToCompare) public view {

        assert(balance >= _priceToCompare);

    }

}