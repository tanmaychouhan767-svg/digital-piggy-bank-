// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title Digital Piggy Bank Smart Contract
 * @dev A smart contract that simulates a digital piggy bank with deposit, withdrawal, and goal-setting features
 */
contract Project {
    // State variables
    address public owner;
    uint256 public balance;
    uint256 public savingsGoal;
    uint256 public creationTime;
    bool public goalAchieved;
    
    // Events
    event Deposit(address indexed depositor, uint256 amount, uint256 newBalance);
    event Withdrawal(address indexed withdrawer, uint256 amount, uint256 remainingBalance);
    event GoalSet(uint256 newGoal);
    event GoalAchieved(uint256 finalBalance, uint256 timeToAchieve);
    
    // Modifiers
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }
    
    modifier hasBalance(uint256 _amount) {
        require(balance >= _amount, "Insufficient balance");
        _;
    }
    
    /**
     * @dev Constructor sets the owner and initializes the piggy bank
     */
    constructor() {
        owner = msg.sender;
        balance = 0;
        savingsGoal = 0;
        creationTime = block.timestamp;
        goalAchieved = false;
    }
    
    /**
     * @dev Core Function 1: Deposit Ether into the piggy bank
     * Anyone can deposit, but only the owner can withdraw
     */
    function deposit() external payable {
        require(msg.value > 0, "Deposit amount must be greater than 0");
        
        balance += msg.value;
        
        // Check if savings goal is achieved
        if (savingsGoal > 0 && balance >= savingsGoal && !goalAchieved) {
            goalAchieved = true;
            emit GoalAchieved(balance, block.timestamp - creationTime);
        }
        
        emit Deposit(msg.sender, msg.value, balance);
    }
    
    /**
     * @dev Core Function 2: Withdraw Ether from the piggy bank
     * Only the owner can withdraw funds
     * @param _amount The amount to withdraw in wei
     */
    function withdraw(uint256 _amount) external onlyOwner hasBalance(_amount) {
        require(_amount > 0, "Withdrawal amount must be greater than 0");
        
        balance -= _amount;
        
        // Transfer the funds to the owner
        (bool success, ) = payable(owner).call{value: _amount}("");
        require(success, "Transfer failed");
        
        emit Withdrawal(msg.sender, _amount, balance);
    }
    
    /**
     * @dev Core Function 3: Set a savings goal
     * Only the owner can set a savings goal
     * @param _goal The savings goal in wei
     */
    function setSavingsGoal(uint256 _goal) external onlyOwner {
        require(_goal > 0, "Savings goal must be greater than 0");
        
        savingsGoal = _goal;
        goalAchieved = false; // Reset goal achievement status
        
        emit GoalSet(_goal);
    }
    
    /**
     * @dev Get the current balance of the piggy bank
     * @return The current balance in wei
     */
    function getBalance() external view returns (uint256) {
        return balance;
    }
    
    /**
     * @dev Get the current savings goal
     * @return The current savings goal in wei
     */
    function getSavingsGoal() external view returns (uint256) {
        return savingsGoal;
    }
    
    /**
     * @dev Check if the savings goal has been achieved
     * @return Boolean indicating if goal is achieved
     */
    function isGoalAchieved() external view returns (bool) {
        return goalAchieved;
    }
    
    /**
     * @dev Get progress towards the savings goal as a percentage
     * @return Progress percentage (0-100)
     */
    function getGoalProgress() external view returns (uint256) {
        if (savingsGoal == 0) {
            return 0;
        }
        
        if (balance >= savingsGoal) {
            return 100;
        }
        
        return (balance * 100) / savingsGoal;
    }
    
    /**
     * @dev Get the time elapsed since piggy bank creation
     * @return Time in seconds since creation
     */
    function getTimeElapsed() external view returns (uint256) {
        return block.timestamp - creationTime;
    }
    
    /**
     * @dev Emergency function to withdraw all funds (break the piggy bank)
     * Only the owner can perform this action
     */
    function breakPiggyBank() external onlyOwner {
        require(balance > 0, "Piggy bank is already empty");
        
        uint256 totalAmount = balance;
        balance = 0;
        
        (bool success, ) = payable(owner).call{value: totalAmount}("");
        require(success, "Transfer failed");
        
        emit Withdrawal(msg.sender, totalAmount, 0);
    }
}
