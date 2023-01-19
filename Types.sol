pragma solidity >=0.7.0;

contract datatypes {

    uint public countPlayer = 0;
    mapping (address => Player) public players;
    enum Level {Begin, Normal, Hard}

    struct Player {
        address addressPlayer;
        Level level;
        string fullName;
        uint age;
        uint createTime;
    }

    function addPlayer(string memory fullName, uint age) public {
        players[msg.sender] = Player(msg.sender, Level.Begin, fullName, age, block.timestamp);
        countPlayer += 1; 
    }

    function getLevelPlayer(address addressPlayer) public returns (Level){
        return players[addressPlayer].level;
    }

    // revert("") thoat lun function
}