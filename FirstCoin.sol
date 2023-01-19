pragma solidity >0.7.0;

contract FirstCoin {

    address public _owner;
    mapping (address => uint) public balances;

    event sent(address from, address to, uint amount);

    modifier onlyOwner {
        require(msg.sender == _owner);
        _;
    }

    modifier checkAmount(uint amount) {
        require(balances[msg.sender] >= amount, "Khong du tien ma doi chuyen");
        _;
    }

    // Thằng deploy token là thằng chủ
    constructor () {
        _owner = msg.sender;
    }

    function mint(address reciever, uint amount) public onlyOwner {
        require(amount < 1e60);
        balances[reciever] += amount;
    }

    function send(address reciever, uint amount) public checkAmount(amount) {
        balances[reciever] += amount;
        balances[_owner] -= amount;
        emit sent(msg.sender, reciever, amount);
    }
}