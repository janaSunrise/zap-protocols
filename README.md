# Zap Protocols

Preset contracts, utilities and libraries to speed up your web3 development workflow. 🛠

## 🛠 Installation

**⚠ NOTE** The package is not yet published.

Install zap protocols package containing the contracts, ABI files and the typechain files
using the following command:

```sh
npm install zap-protocols
```

## 🛠 Usage

Quickly get started by installing the dependencies as mentioned above.

Use the contracts under 60 seconds.

```solidity
// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.9;

import '@openzeppelin/contracts/token/ERC20/ERC20.sol';
import '@openzeppelin/contracts/access/Ownable.sol';
import 'zap-protocols/contracts/transfer/TransferRestrictable.sol';

contract Token is ERC20, Ownable, TransferRestrictable {
  constructor(string memory _name, string memory _symbol)
    ERC20(_name, _symbol)
  {}

  /// @dev Override to ensure only owner can toggle the transfer restriction.
  function setAllowsTransfer(bool _allowsTransfer) public override onlyOwner {
    super.setAllowsTransfer(_allowsTransfer);
  }

  function _beforeTokenTransfer(
    address from,
    address to,
    uint256 amount
  ) internal override(ERC20, ERC20Pausable) {
    require(
      from == address(0) || to == address(0) || isTransferAllowed(),
      'Not allowed to transfer'
    );

    super._beforeTokenTransfer(from, to, amount);
  }
}

```

Whew, that was a breeze! 🌊

You can use the contract ABIs and the typechain bindings aswell in your javascript/typescript programs
to create your wrapper modules and lot more! ✨

## 👇 Pre-requisites for development

Ensure that you have the following tools ready and installed to use this:

- Git
- Node.js

Setup the environmental variables if you haven't yet.

You can setup the `.env` variables based on the `.env.example` file as provided. Setup the file using
`cp .env.example .env` and fill in the values.

## Contributing

Contributions, issues and feature requests are welcome. After cloning & setting up project locally, you
can just submit a PR to this repo and it will be deployed once it's accepted.

⚠️ It's good to have descriptive commit messages, or PR titles so that other contributors can understand about your
commit or the PR Created. Read [conventional commits](https://www.conventionalcommits.org/en/v1.0.0-beta.3/) and
[Gitmoji](https://gitmoji.dev/) before making the commit message.

## Show your support

We love people's support in growing and improving. Be sure to leave a ⭐️ if you like the project and
also be sure to contribute, if you're interested!

<div align="center">Made by Sunrit Jana with ❤</div>
