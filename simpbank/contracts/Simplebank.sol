pragma solidity ^0.5.0;
import "remix_tests.sol"; // this import is automatically injected by Remix.
//import "./test1_test.sol";


contract Pay {
   uint8 private clientCount;
    mapping (address => uint) public balances;
    address public owner;

  // Log the event about a deposit being made by an address and its amount
    event LogDepositMade(address indexed accountAddress, uint amount);

    // Constructor is "payable" so it can receive the initial funding of 30, 
    // required to reward the first 3 clients
    constructor() public payable {
                //    require(msg.value == 30 ether, "30 ether initial funding required");
        /* Set the owner to the creator of this contract */
                    owner = msg.sender;
                  //  address owner = msg.sender;
        clientCount = 0;
    }

    // @notice Enroll a customer with the bank, 
    // giving the first 3 of them 10 ether as reward
    // @return The balance of the user after enrolling
//    function enroll() public returns (uint) {
 /*       if (clientCount < 10) {
            clientCount++;
            balances[msg.sender] = 10 ether;
        }
*/        
      //  return balances[msg.sender];
    //}
   


    // @notice Withdraw ether from bank
    // @return The balance remaining for the user
    function withdraw(uint payAmount) public returns (uint remainingBal) {
        // Check enough balance available, otherwise just return balance
        if (payAmount <= balances[msg.sender]) {
            balances[msg.sender] -= payAmount;
            msg.sender.transfer(payAmount);
        }
        return balances[msg.sender];
    }

    // @notice Just reads balance of the account requesting, so "constant"
    // @return The balance of the user
    function balance() public view returns (uint) {
        return balances[msg.sender];
    }

    // @return The balance of the Simple Bank contract
    function depositsBalance() public view returns (uint) {
        return address(this).balance;
    }
}