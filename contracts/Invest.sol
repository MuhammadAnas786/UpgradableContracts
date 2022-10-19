pragma solidity >=0.8.0;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
// import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";

contract Invest is Initializable, ERC20Upgradeable {
 mapping( address => uint ) public userBalances;
 

 fallback() external payable{
    invest();
 }

 function initialize( ) public initializer {
    __ERC20_init("InvestToken","IVT");
 }
 

 function invest()public payable{ 
    _mint( msg.sender, msg.value );
    userBalances[msg.sender] = msg.value;
     }

 function withdraw()public { 
    require( userBalances[msg.sender] > 0 &&  balanceOf(msg.sender) > 0," Nothing invested to withdraw ");
    userBalances[msg.sender] = 0;
    _burn( msg.sender, balanceOf(msg.sender) );
    (bool sent, ) = payable(msg.sender).call{ value: userBalances[msg.sender] }("");
    require(sent, "Failed to send Ether");
  }

  function getUserBalance(address _user)public view returns( uint ) { return userBalances[_user]; }

  function getContractBalance()public view returns( uint ) { return address(this).balance; }

}