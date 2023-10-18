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

#### Getting Mining Rewards

In `config.toml`, change `--miner-coinbase` to your account's address.

## Block Explorer

[Sirato free plan](https://github.com/web3labs/sirato-free) is used as block explorer for the network.
Sirato instance is configured to connect to `besu-dev`.
For simplicity, we use its own docker compose.

To start a sirato instance, open another terminal and run

```Bash
sh sirato-up.sh
```

After few minutes, it will be available at [localhost:8080](http://localhost:8080).
If port collision happens, change sirato's port in `sirato-up.sh` then re-run it.

To clean up, run

```Bash
sh sirato-down.sh
```
