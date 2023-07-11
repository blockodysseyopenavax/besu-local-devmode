# Besu Local Devmode

Run besu local node in devmode via docker.

## Getting Started

### Requirements

- docker

### Usage

1. Start the node _besu-dev_ by

   ```Bash
   docker compose up
   ```

2. Check if node is working by `curl` or `cast`:

   ```Bash
   curl localhost:8545 -XPOST -d '{"jsonrpc":"2.0","id":1,"method":"eth_blockNumber"}'
   ```

   ```Bash
   cast rpc eth_blockNumber
   ```

3. Clean up the node by

   ```Bash
   docker compose down
   ```

#### Get mining reward

To get mined ETH to your account, replace `--miner-coinbase` address in `config.toml`.

#### Persist node state

To persist node state,

1. Create docker volume _besu-dev-database_ by

   ```Bash
   # ./create-volume.sh
   docker volume create besu-dev-database
   docker run --rm -v besu-dev-database:/opt/besu/database:rw ubuntu /bin/sh -c "useradd besu && chown besu:besu /opt/besu/database"
   ```

2. Remove all comments in `docker-compose.yaml` then run the node.

3. To clean up the volume after shutting down, run

   ```Bash
   docker volume rm besu-dev-database
   ```

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
