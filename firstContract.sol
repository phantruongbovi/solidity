pragma solidity >=0.7.0;

contract firstContract {
    uint saveData;

    function set(uint x) public {
        saveData = x;
    }

    function get() public view returns(uint x) {
        return saveData;
    }
}