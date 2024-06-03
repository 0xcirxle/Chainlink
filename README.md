# Proracle 🔮

### Transforming Data Verification with zk-email

### Fetch and verify any data, like AAPL stock from NASDAQ, and securely put it on any blockchain. Create tokens pegged to real-world assets.

## What it does
Our project, Proracle, uses zk-email to fetch and verify any data from trusted sources. For example, if a user wants real-time stock data for AAPL, our app retrieves it from NASDAQ, verifies it using zk-SNARKs, and securely records it on the blockchain. This verified data can then be used to create a token for AAPL stock, functioning like a stablecoin pegged to its value. Proracle ensures that verified data is available across multiple blockchain networks, enhancing its utility in various applications from financial services to healthcare and supply chain management.

### How it is built?
The project consists of several parts:
- Registration of user through WalletConnect
- Selection of oracle parameters via form
- Data fetching and Zero-Knowledge proof of source through circom circuits.
- Data passed onchain

## Links To Repositories
- [React Frontend](https://github.com/0xcirxle/Chainlink/frontend)
- [BackEnd](https://github.com/0xcirxle/Chainlink/backend)
- [Smart Contracts](https://github.com/0xcirxle/Chainlink/contracts)
- [Zk-Circuits](https://github.com/0xcirxle/Chainlink/ZK)

**Architecture**

### User:
![user_flow](https://github.com/0xcirxle/Chainlink/assets/156283441/d2c56aef-0246-40fc-8b72-d080c61c7301) <br>

### Server:
![proof_flow](https://github.com/0xcirxle/Chainlink/assets/156283441/d266c01a-9a83-4368-af0e-705323b59641) <br>

### Tokenized Real World Assets Demo:
![demo_trwa](https://github.com/0xcirxle/Chainlink/assets/156283441/1cc736bf-0b13-43a8-9d75-c17d2c1aeaef) <br>

When user connects the wallet, they are redirected to the generate oracle page where they customise the oracle, after clicking on generate they are taken to a page where the contract address is given. User can copy that address and use that to utilize the getter functions to fetch the data on chain.

While the above process is going on the server gets the email from the source, it then parses the email and sends it through the ZK circuits which generate a proof is the input is valid. The backend sends the proof onchain where it is put in contract verifier.sol where it is checked whether the proof is correct or not. If the proof is correct then the data is updated in the variable.
