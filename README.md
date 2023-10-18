# Besu Local Devmode

Run besu in local devmode.

## Getting Started

### Requirements

- docker

### Usage

1. Start the container _besu-dev_ by

   ```Bash
   docker compose up
   ```

2. Check if node is working by `curl`:

   ```Bash
   curl localhost:8545 -XPOST -d '{"jsonrpc":"2.0","id":1,"method":"eth_blockNumber"}'
   ```

   or `cast`:

   ```Bash
   cast rpc eth_blockNumber
   ```

3. Clean up the node by

   ```Bash
   docker compose down
   ```

### Getting Mining Rewards

In `config.toml`, change `--miner-coinbase` to your account's address.

### Attaching Block Explorer

[Sirato free plan](https://github.com/web3labs/sirato-free) is free version of Sirato block explorer.
By using its own docker compose, we can spin up an instance connected to `besu-dev`.

First, install the git submodule _sirato-free_ by

```Bash
git submodule update
```

Then run the start script for Sirato by

```Bash
sh sirato-up.sh
```

After few minutes, it will be available at [localhost:8080](http://localhost:8080).
If port collision happens, change sirato `PORT` in `sirato-up.sh`.

To clean up, run

```Bash
sh sirato-down.sh
```
