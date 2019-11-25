contract Logger{
    function log(uint value) external;
}

contract Bank{

    mapping(address => uint) balances;
    
    function withdraw(Logger l) external{
        uint balance = balances[msg.sender];
        l.log(balance);
        balances[msg.sender] = 0;
        msg.sender.transfer(balance);
    }
    
    function () external payable{
        balances[msg.sender] += msg.value;
    }

}
