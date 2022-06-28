A classic feature of NFTs is being able to receive them to stake tokens.

Create a contract where users can send their NFTs and withdraw 10 ERC20 tokens every 24 hours. The user can withdraw the NFT any time. The smart contract must take possession of the NFT and only the user should be able to withdraw it. Beware of the corner case of re-staking to bypass the timer.

Hint: to test the contract, use a shorter timeframe. Remix will respect local timestamps.