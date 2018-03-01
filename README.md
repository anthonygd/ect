# EthereumColumbusToken
Smart contract development

## installation
I'm recommending Truffle as the build environment.  You can learn all about it here http://truffleframework.com

Installation is simply:
~~~~
$ npm install -g truffle
~~~~

You'll need a blockchain to go with it. Truffle should work with most via JSON-RPC.  Ganache has a pretty UI on Mac/Linux and supports auto-mining.  You can install the UI easily from here http://truffleframework.com/ganache/

Unfortunately due to what I think is an old dependency bundled with the UI there are a couple more steps:
~~~~
$ npm install -g ganache-core
$ npm install -g ganache-cli
~~~~

To make unit testing smart contracts from JavaScript suck less you'll want a couple more modules:
~~~~
$ npm install babel-register
$ npm install babel-polyfill
~~~~

## starting
Run Ganache.app.  The Logs view is the most immediately useful for diagnosing but Transactions and Blocks are fun too.

In a terminal from the project root start Truffle and deploy contracts:

~~~~
$ truffle --network ganache console
truffle(ganache)> migrate
~~~~

Possible networks are configured in title-tokens/tuffle.js

* If you don't specify '--network ganache' it will default to develop.  This works fine for the most part and is not persistent.
* You can specify '--network geth' if you'd like.  You need to have geth configured with RPC and mining.  The project includes a genesis.json but I'm not documenting how to use it.  This has the advantage/disadvantage of being a real, persistent, industrial strength blockchain implementation.

## develop

Before making any changes, run the unit tests.  Unit tests can be written in either JavaScript or Solidity.  Remember unit tests written in Solidity have all the same security restrictions as other smart contracts, i.e. you can't control what account runs your test so account restricted operations might not be testable.

Each execution goes against a fresh blockchain so a migrate always happens first.
~~~~
truffle(ganache)> test
Using network 'ganache'.



  Contract: EthereumColumbusToken
    ✓ should start with no tokens
    ✓ should be able to mint tokens (95ms)
    ✓ should be able to transfer tokens (127ms)
    ✓ should not be able to transfer more than I have (1095ms)
    ✓ should not be able to transfer more than approved amount (242ms)


  5 passing (2s)

truffle(ganache)>
~~~~

Now that you are confident things should work, use your editor of choice and edit the .sol files living in title-tokens/contracts.

If you create a new contract you'll need to create a new JavaScript migration script for deploying it.  Use the naming convention title-tokens/migrations/number_contract_name_migration.js.

Once happy with your changes (and you've rerun the tests) you can redeploy:
~~~~
truffle(ganache)> migrate
~~~~

The migrate command will take care of
1. Did the .sol file change?
2. If so compile it to JSON format in title-tokens/build/contracts/foo.json
3. Has something with an identical checksum already been deployed?
4. If not, then deploy.

If migrate ever gets confused about what it's already deployed you issue a reset:
~~~~
truffle(ganache)> migrate --reset
~~~~

Rejoice.
