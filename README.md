<img width="1918" height="977" alt="Screenshot 2025-09-27 135201" src="https://github.com/user-attachments/assets/96b52e21-2528-46a1-9325-1a78fbf9e88c" />
# Digital Piggy Bank Smart Contract

## Project Description

The Digital Piggy Bank Smart Contract is a blockchain-based savings solution that brings the traditional concept of a piggy bank into the digital age. This Ethereum-based smart contract allows users to deposit Ether, set savings goals, track progress, and withdraw funds securely. The contract mimics the functionality of a physical piggy bank while leveraging the transparency, security, and programmability of blockchain technology.

The smart contract provides a decentralized savings mechanism where users can accumulate cryptocurrency over time, set financial goals, and monitor their progress. It's designed to encourage disciplined saving habits while providing the security and immutability that comes with blockchain technology.

## Project Vision

Our vision is to revolutionize personal savings by creating a trustless, transparent, and accessible digital savings platform that:

- **Democratizes Savings**: Makes saving accessible to anyone with an internet connection and cryptocurrency
- **Promotes Financial Discipline**: Encourages consistent saving habits through goal-setting and progress tracking
- **Ensures Security**: Utilizes blockchain technology to provide unmatched security for users' savings
- **Builds Financial Literacy**: Introduces users to decentralized finance (DeFi) concepts through familiar savings mechanisms
- **Eliminates Intermediaries**: Removes the need for traditional banking institutions for basic savings functionality

We envision a future where digital piggy banks become the foundation for more sophisticated DeFi savings products, helping individuals build wealth and achieve financial independence through blockchain technology.

## Key Features

### Core Functionality
- **Secure Deposits**: Accept Ether deposits from any address with full transparency
- **Owner-Only Withdrawals**: Ensure only the piggy bank owner can withdraw funds
- **Savings Goal Setting**: Allow users to set and track progress toward financial goals
- **Goal Achievement Tracking**: Automatically detect when savings goals are reached
- **Emergency Withdrawal**: "Break the piggy bank" function for complete fund withdrawal

### Advanced Features
- **Progress Monitoring**: Real-time percentage tracking toward savings goals
- **Time Tracking**: Monitor how long it takes to achieve savings goals
- **Event Logging**: Comprehensive event emission for all major actions
- **Balance Inquiry**: View current balance and savings goal status
- **Multiple Access Levels**: Different permissions for depositors vs. the owner

### Security Features
- **Access Control**: Robust modifier system ensuring proper permissions
- **Input Validation**: Comprehensive checks for all user inputs
- **Reentrancy Protection**: Safe withdrawal patterns to prevent attacks
- **Error Handling**: Clear error messages for all failure conditions

## Future Scope

### Short-term Enhancements (3-6 months)
- **Multiple Currency Support**: Support for ERC-20 tokens beyond Ether
- **Automated Savings**: Integration with recurring deposit functionality
- **Interest Earning**: Basic yield generation through DeFi protocol integration
- **Mobile DApp**: User-friendly mobile application for easy access

### Medium-term Developments (6-12 months)
- **Family Piggy Banks**: Multi-user piggy banks for family savings goals
- **Milestone Rewards**: NFT or token rewards for achieving savings milestones
- **Savings Challenges**: Community-driven savings competitions and challenges
- **Analytics Dashboard**: Comprehensive savings analytics and insights

### Long-term Vision (1-3 years)
- **DeFi Integration**: Full integration with lending, borrowing, and yield farming protocols
- **Cross-Chain Compatibility**: Support for multiple blockchain networks
- **AI-Powered Insights**: Machine learning for personalized savings recommendations
- **Social Features**: Social savings groups and collaborative goal achievement
- **Institutional Features**: Corporate and organizational savings solutions
- **Regulatory Compliance**: KYC/AML integration for institutional adoption

### Advanced Features
- **Programmable Savings**: Smart contract automation for complex savings strategies
- **Insurance Integration**: Deposit insurance through decentralized insurance protocols
- **Governance Token**: Community governance for protocol upgrades and decisions
- **Educational Platform**: Integrated financial literacy and DeFi education modules

## Installation and Deployment

### Prerequisites
- Node.js (v16 or higher)
- npm or yarn package manager
- Hardhat or Truffle development framework
- MetaMask or similar Ethereum wallet

### Quick Start
```bash
# Clone the repository
git clone [repository-url]
cd Digital-Piggy-Bank-Smart-Contract

# Install dependencies
npm install

# Compile the contract
npx hardhat compile

# Deploy to local network
npx hardhat run scripts/deploy.js --network localhost

# Deploy to testnet
npx hardhat run scripts/deploy.js --network sepolia
```

### Testing
```bash
# Run all tests
npx hardhat test

# Run with coverage
npx hardhat coverage
```

## Usage Examples

### Basic Operations
```javascript
// Deploy the contract
const PiggyBank = await ethers.getContractFactory("Project");
const piggyBank = await PiggyBank.deploy();

// Deposit funds
await piggyBank.deposit({ value: ethers.utils.parseEther("1.0") });

// Set a savings goal
await piggyBank.setSavingsGoal(ethers.utils.parseEther("10.0"));

// Check progress
const progress = await piggyBank.getGoalProgress();
console.log(`Savings progress: ${progress}%`);

// Withdraw funds (owner only)
await piggyBank.withdraw(ethers.utils.parseEther("0.5"));
```

## Contract Functions

### Core Functions
- `deposit()` - Deposit Ether into the piggy bank (payable)
- `withdraw(uint256 _amount)` - Withdraw specific amount (owner only)
- `setSavingsGoal(uint256 _goal)` - Set savings target (owner only)

### View Functions
- `getBalance()` - Get current balance
- `getSavingsGoal()` - Get savings goal amount
- `isGoalAchieved()` - Check if goal is achieved
- `getGoalProgress()` - Get progress percentage (0-100)
- `getTimeElapsed()` - Time since contract creation

### Emergency Function
- `breakPiggyBank()` - Withdraw all funds at once (owner only)

## Contributing

We welcome contributions to the Digital Piggy Bank Smart Contract project! Please read our contributing guidelines and submit pull requests for any improvements.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Contact

For questions, suggestions, or collaboration opportunities, please reach out to our development team.

---

**Built with ❤️ for the DeFi community**
